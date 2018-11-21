class ToppagesController < ApplicationController
  def index
    if logged_in?
      @q = Post.ransack(params[:q])
      @posts = @q.result.page(params[:page]).per(10).order(created_at: :DESC)
    else
      @posts=Post.order('created_at DESC').page(params[:page]).per(3)
    end
  end
  
  private
  
  def search_params
    params.require(:q).permit(:book_title)
  end
end
