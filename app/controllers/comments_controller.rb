class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    author = post.user
    @comment = Comment.new(comment_params)
    @comment.post = post
    @comment.user = current_user

    render :new unless @comment.save

    redirect_to user_post_url(author, post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
