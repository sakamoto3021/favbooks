class ToppagesController < ApplicationController
  def index
    if logged_in?
      @posts=Post.order('created_at DESC').page(params[:page]).per(10)
    else
      @posts=Post.order('created_at DESC').page(params[:page]).per(3)
    end
  end
end
