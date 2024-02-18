class PostsController < ApplicationController
  def index
    if params[:latest]
      @posts = Post.latest.page(params[:page]).per(10)
    elsif params[:old]
      @posts = Post.old.page(params[:page]).per(10)
    else
      @posts = Post.latest.page(params[:page]).per(10)
    end
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end

  def create
    require 'open-uri'

    @post = Post.new(post_params)

    html = URI.open(@post.url).read
    doc = Nokogiri::HTML.parse(html)

    @post.url_title = doc.css('meta[property="og:title"] @content').to_s

    image = doc.css('meta[property="og:image"] @content').to_s
    @post.url_image.attach(io: URI.open(image), filename: image)

    @post.user_id = current_user.id
    @post.save
    redirect_to action: 'index'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to action: 'index',  notice: "投稿を削除しました。"
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    require 'open-uri'

    @post = Post.find(params[:id])

    html = URI.open(@post.url).read
    doc = Nokogiri::HTML.parse(html)

    @post.url_title = doc.css('meta[property="og:title"] @content').to_s

    image = doc.css('meta[property="og:image"] @content').to_s
    @post.url_image.attach(io: URI.open(image), filename: image)

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
    def search_posts_params
      params.fetch(:q, {}).permit(
        :title,
        :genre,
      )
    end

    def post_params
      params.require(:post).permit(
        :title, 
        :body, 
        :genre,
        :url,
        :image,
        :image_cache,)
    end
end
