class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  
  def new
  end
  
  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:success] = "パスワード再設定のメールをお送りしました"
      redirect_to root_url
    else
      flash[:danger] = "メールの送信に失敗しました。メールアドレスをご確認ください。"
      render :new
    end
  end

  def edit
  end
  
  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, :blank)
      flash.now[:danger]='パスワードが入力されていません'
      render 'edit'
    elsif @user.update_attributes(user_params)
      flash[:success] = "パスワードをリセットしました"
      redirect_to login_path
    else
      flash.now[:danger]="パスワードが一致しません"
      render 'edit'
    end
  end
  
  private
  
  def get_user
    @user = User.find_by(email: params[:email])
  end
  
  def valid_user
    unless (@user && @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end
  
  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "Password reset has expired."
      redirect_to new_password_reset_url
    end
  end
  
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
