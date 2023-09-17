class PostsController < ApplicationController
  def index
    @posts = Post.all.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to action: 'index'
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def favorites
    @posts = current_user.favorites_posts
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :genre)
  end
end
