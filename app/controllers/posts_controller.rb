class PostsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy, :confirm]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.order('created_at DESC').page(params[:page])
    if logged_in?
      redirect_to root_path
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @item = @post.item
  end

  def new
    @post = current_user.posts.build(item_id: params[:item_id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    elsif @post.save
      flash[:success] = '投稿を作成しました'
      redirect_to @post
    else
      flash.now[:danger] = '投稿の作成に失敗しました'
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if params[:back]
      render :edit
    elsif
      @post.update(post_params)
      flash[:success] = '投稿を編集しました'
      redirect_to @post
    else
      flash.now[:danger] = '投稿の編集に失敗しました'
      render 'new'
    end
  end
  
  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end
  
  def destroy
    @post.destroy
    flash[:success]='投稿を削除しました'
    redirect_to root_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:book_title, :content_title, :content, :item_id)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_path
    end
  end
end
