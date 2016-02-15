class LikesController < ApplicationController
  def create
    Like.create(user_id:params[:user_id], secret_id:params[:secret_id])
    redirect_to secrets_index_path
  end

  def destroy
  end
end
