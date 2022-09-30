class PostsController < ApplicationController
  def index
    @user = User.find(params[:authorId])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:authorId])
    @post = @user.posts.find(params[:id])
  end
end
