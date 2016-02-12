class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:Email])
      if user && user.authenticate(params[:Password])
        session[:user_id] = user.id
        session[:user_name] = user.name
        redirect_to "/users/#{user.id}"
      else
        flash[:errors] = 'Invalid email or password'
        redirect_to sessions_new_path
      end
  end

end