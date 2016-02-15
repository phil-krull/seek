class SecretsController < ApplicationController
  before_action :require_login, only: [:create, :destroy, :index]

  def index
    @secret = Secret.all
  end

  def create
    puts params
    Secret.create(params_create)
    redirect_to "/users/#{params[:secrets][:user_id]}"
  end

  def destroy
    secret = Secret.find( params[:id] )
    secret.destroy if secret.user == current_user
    redirect_to "/users/#{current_user.id}"
  end

  private

  def params_create
    params.require(:secrets).permit(:user_id, :content)
  end

end
