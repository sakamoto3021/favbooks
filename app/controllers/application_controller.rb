class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
  def require_user_logged_in
    unless logged_in?
      flash[:danger] = 'ログインが必要です'
      redirect_to login_path
    end
  end
  
  def counts(user)
    @count_posts = user.posts.count
    @count_fav_posts = user.fav_posts.count
  end
  
end
