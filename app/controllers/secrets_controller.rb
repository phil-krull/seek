class SecretsController < ApplicationController

  def index
    @secret = Secret.all
  end

  def create
    Secret.create(params_create)
    redirect_to "/users/#{params[:secrets][:user_id]}"
  end

  def destroy
    Secret.find( params[:id] ).destroy
    redirect_to "/users/#{params[:user_id]}"
  end

  private

  def params_create
    params.require(:secrets).permit(:user_id, :content)
  end

end
