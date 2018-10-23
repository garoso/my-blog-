class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all
  end
  def show
    @post = Post.find(params[:id])
  end
end
