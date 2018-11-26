class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @post = Post.find(params[:like_id])
    current_user.like(@post)
  end

  def destroy
    @post = Post.find(params[:like_id])
    current_user.unlike(@post)
  end
end
