class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[edit update destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to current_user, notice: 'Post successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to current_user, notice: 'Post successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to current_user, notice: 'Post successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :tags)
  end
end
