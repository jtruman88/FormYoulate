module SessionsHelper
  # Logs in the given user by adding their id to the session
  #
  # @param user [User] the user to log in
  # @return [void]
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Logs out the currently signed in user by clearing the session and current_user
  #
  # @return [void]
  def log_out
    reset_session
    @current_user = nil
  end
  
  # Returns the currently logged in user if one exists
  #
  # @return [User] the currently logged in user
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  
  # Checks whether or not a user is currently logged in
  #
  # @return [Boolean] whether or not a user is logged in
  def logged_in?
    current_user.present?
  end
end
