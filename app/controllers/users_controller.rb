class UsersController < ApplicationController

  def login
  end

  def create
    user = User.new( params_create)
    if user.valid?
      @user = User.create( params_create )
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to users_new_path
    end
  end

  private

  def params_create
    params.require(:user).permit(:name, :email, :password)
  end

end