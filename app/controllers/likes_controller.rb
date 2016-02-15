class LikesController < ApplicationController
  def create
    if session[:user_id]
      Like.create(user_id:params[:user_id], secret_id:params[:secret_id])
      redirect_to secrets_index_path
    else redirect_to sessions_new_path
    end
  end

  def destroy
    if session[:user_id] == params[:user_id]
      like = Like.where(user_id:params[:user_id], secret_id:params[:secret_id]).last.destroy
      redirect_to secrets_index_path
    else
      redirect_to sessions_new_path
    end
  end
end
