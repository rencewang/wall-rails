class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.includes(:user).all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to current_user
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :tags)
  end
end
