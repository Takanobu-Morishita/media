class PostsController < ApplicationController
  def index
    @q = SearchPostsForm.new(search_post_params)
    posts_all = Post.all
    @posts = PostsFinder.new(@q, posts_all).execute.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
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

  def bookmarks
    @posts = current_user.bookmarks_posts
  end

  private
    def search_post_params
      params.fetch(:q, {}).permit(
        :title,
        :genre,
        :body,
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
