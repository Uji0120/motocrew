class Admin::CommentsController < ApplicationController

  # def create
  #   @post = Post.find(params[:post_image_id])
  #   comment = current_user.post_comments.new(post_comment_params)
  #   comment.post_image_id = post_image.id
  #   comment.save
  #   redirect_to admin_post_path(post)
  # end
  
  # def destroy
  #   Post.find(params[:id]).destroy
  #   redirect_to admin_post_path(params[:post_id])
  # end

  # private

  # def post_comment_params
  #   params.require(:post_comment).permit(:comment)
  # end
  
   def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post.id)
   end
 
 def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_posts_path
 end

  private

  def post_comment_params
    params.require(:comment).permit(:comment)
  end
 
end