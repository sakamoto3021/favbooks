class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order('created_at DESC').page(params[:page])
    counts(@user)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if params[:back]
      redirect_to @user
    elsif @user.update(user_params)
      redirect_to @user
      flash[:success]='プロフィールを更新しました'
    else
      render :edit
      flash.now[:danger]='プロフィールの更新に失敗しました'
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'ユーザーを登録しました'
      redirect_to root_path
    else
      flash.now[:danger]= 'ユーザーの登録に失敗しました'
      render :new
    end
  end
  
  def fav_posts
    @user = User.find(params[:id])
    @posts = @user.fav_posts.order('created_at DESC').page(params[:page])
    counts(@user)
  end
  
  def destroy
    current_user.destroy
    redirect_to root_path
  end
  
private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :remove_image)
  end
  
end
