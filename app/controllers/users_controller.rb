class UsersController < ApplicationController
  before_action :authenticate_user!

  # path helper: user_path(@user)
  def show
    @user = current_user
    @created_events = Event.where(creator_id: current_user.id)
  end
end
