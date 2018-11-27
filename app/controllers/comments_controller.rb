class CommentsController < ApplicationController
  before_action :require_user_logged_in

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      
    else
      redirect_to request.referrer || root_url
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    # redirect_to request.referrer || root_url
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
