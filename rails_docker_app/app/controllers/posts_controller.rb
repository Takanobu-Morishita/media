class PostsController < ApplicationController
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
    @post = Post.new(post_params) #データを新規登録するためのインスタンス生成
    @post.save #データをデータベースに保存するためのsaveメソッド実行
    redirect_to action: 'index' #トップ画面へリダイレクト
  end
  
  private
  def post_params #ストロングパラメータ
    params.require(:post).permit(:title, :body, :genre) #パラメーターのキー
  end
end
