class UsersController < ApplicationController

  def login
    @user = User.find(params[:id])
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

  private

  def params_create
    params.require(:user).permit(:name, :email, :password)
  end

end