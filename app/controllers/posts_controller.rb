class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all
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
      redirect_to posts_path, info: "El post se publico exitosamente"
    else
      render :new
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path, success: "El post se edito exitosamente"
    else
      render :edit, danger: "No se pudo editar el post"
    end
  end
  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id )
  end
end
