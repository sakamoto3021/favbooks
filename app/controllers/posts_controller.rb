class PostsController < ApplicationController
  def show
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
  end
  
  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  def update
  end

  def destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:book_title, :content_title, :content)
  end
end
