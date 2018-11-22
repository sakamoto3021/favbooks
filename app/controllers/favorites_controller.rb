class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    post = Post.find(params[:like_id])
    current_user.like(post)
    flash[:success] = 'お気に入りに追加しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post = Post.find(params[:like_id])
    current_user.unlike(post)
    flash[:success] = 'お気に入りを削除しました'
    redirect_back(fallback_location: root_path)
  end
end
