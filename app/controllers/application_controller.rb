class ApplicationController < ActionController::Base
  include SessionsHelper

  private
  
  # Checks whether or not a user is the currently logged in user
  # redirects to root_path if not
  #
  # @return [void]
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_user
  end
  
  # Checks whether or not a user is currently logged in
  # redirects to signin_path if not
  #
  # @return [void]
  def logged_in_user  
    redirect_to signin_path unless logged_in?
  end
end
