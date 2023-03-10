class User::CommentsController < ApplicationController
 
 def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post.id)
 end
 
 def destroy
    Comment.find(params[:id]).destroy
    redirect_to posts_path
 end

  private

  def post_comment_params
    params.require(:comment).permit(:comment)
  end
 
end
