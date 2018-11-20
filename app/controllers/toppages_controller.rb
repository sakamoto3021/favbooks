class ToppagesController < ApplicationController
  def index
    if params[:search].present?
      # @q = Post.ransack(params[:q])
      # @posts = @q.result.page(params[:page]).order(created_at: :DESC)
      search = params[:search]
      @posts = Post.where(['book_title LIKE ?', "%#{search}%"]).page(params[:page]).order('created_at DESC')
    else
      if logged_in?
        @posts = Post.order('created_at DESC').page(params[:page]).per(10)
      else
        @posts=Post.order('created_at DESC').page(params[:page]).per(3)
      end
    end
  end
end
