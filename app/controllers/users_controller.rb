class UsersController < ApplicationController
  before_action :correct_user, only: [:show]

  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
