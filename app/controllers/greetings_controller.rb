class GreetingsController < ApplicationController
  def create
    greeting = current_user.sent_greetings.create(greeting_params)
    html_greeting = render greeting
    Pusher[greeting_params[:recipient_id].to_s].trigger('new_greeting', {greeting: html_greeting})
  end

  private

  def greeting_params
    params.require(:greeting).permit(
      :message,
      :recipient_id,
    )
  end

  def pusher_params
    params.require(:greeting).permit(
      :message,
    )
  end
end

