class BookmarksController < ApplicationController
  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）

  # お気に入り登録
  def create
    post = Post.find(params[:post_id])
    current_user.bookmark(post)
    redirect_back fallback_location: posts_path
  end

  def destroy
    post = current_user.bookmarks_posts.find(params[:post_id])
    current_user.unbookmark(post)
    redirect_back fallback_location: posts_path
  end
end