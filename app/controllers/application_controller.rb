class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # By adding this method in our ApplicationController, all of our controllers will have access to this
  # method (since all controllers inherit from this controller). By specifying helper_method :current_user, 
  # we make this method available in all of our view files as well.

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end

