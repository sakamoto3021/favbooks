class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
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
  
  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = '投稿を編集しました'
      redirect_to @post
    else
      flash.now[:danger] = '投稿の編集に失敗しました'
      render 'new'
    end
  end

  def destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:book_title, :content_title, :content)
  end
end
