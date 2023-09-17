class FavoritesController < ApplicationController
  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）

  # お気に入り登録
  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    redirect_back fallback_location: posts_path
  end

  def destroy
    post = current_user.favorites_posts.find(params[:post_id])
    current_user.unfavorite(post)
    redirect_back fallback_location: posts_path
  end

end
