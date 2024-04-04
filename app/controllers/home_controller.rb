class HomeController < ApplicationController
  def index
    @posts = Post.includes(:user).all.order(created_at: :desc)
  end
end
