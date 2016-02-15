class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def login
    @user = User.find(params[:id])
    @secret = User.find(params[:id]).secrets
  end

  def create
    user = User.new( params_create )
    if user.valid?
      user.save
      redirect_to "/users/#{user.id}"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to users_new_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]).update( params_create )
    redirect_to "/users/#{params[:id]}"
  end

  def destroy
    User.find(params[:id]).destroy
    session[:user_id] = nil
    redirect_to sessions_new_path
  end

  private

  def params_create
    params.require(:user).permit(:name, :email, :password)
  end

end