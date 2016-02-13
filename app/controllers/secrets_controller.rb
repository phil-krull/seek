class SecretsController < ApplicationController

  def index
    @secret = Secret.all
  end

  def create
    puts params[:secrets][:user_id]
    puts params[:secrets][:content]
    Secret.create( params_create )
    redirect_to "/users/#{params[:secrets][:user_id]}"
  end

  private

  def params_create
    puts params
    params.require(:secrets).permit(:user_id, :content)
  end

end
