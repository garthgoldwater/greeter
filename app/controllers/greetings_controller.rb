class GreetingsController < ApplicationController
  def create
    current_user.sent_greetings.create(greeting_params)
    Pusher['test_channel'].trigger('my_event', { message: 'hello world' })
  redirect_to :dashboard
  end

  private

  def greeting_params
    params.require(:greeting).permit(
      :message,
      :recipient_id,
    )
  end
end
