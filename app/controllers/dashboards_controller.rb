class DashboardsController < ApplicationController
  def show
    @users = User.all
    @greeting = Greeting.new
    @greetings = current_user.received_greetings.order("created_at DESC")
  end
end
