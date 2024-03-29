class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts

    if current_user.present?
      favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
      @favorite_list = Post.find(favorites)

      bookmarks = Bookmark.where(user_id: current_user.id).pluck(:post_id)
      @bookmark_list = Post.find(bookmarks)
    end

    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)

    bookmarks = Bookmark.where(user_id: @user.id).pluck(:post_id)
    @bookmark_posts = Post.find(bookmarks)
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to action: 'index',  notice: "ユーザを削除しました。"
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to action: 'index'
    else
      render :new
    end
  end

  private
    def search_users_params
      params.fetch(:q, {}).permit(
        :store_name,
        :department,
        :name,
        :name_kana,
        :email,
        statuses: [],
        roles: [],
      )
    end
    
    def user_params
      params.require(:user).permit(
        :username, 
        :profile, 
        :email, 
        :role,
        :image, 
        :image_cache,)
    end
end
