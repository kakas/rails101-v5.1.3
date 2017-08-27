class Account::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to account_posts_path
    else
      render :edit
    end
  end

  def destory
    @post = current_user.posts.find(params[:id])
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
