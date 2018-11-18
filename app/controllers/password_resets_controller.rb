class PasswordResetsController < ApplicationController
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
  end
end
