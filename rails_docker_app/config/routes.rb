Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :posts, only:[:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :favorites, only: %i[create destroy]
    resources :bookmarks, only: %i[create destroy]
    resources :post_comments, only: [:create]
  end
  resources :users, only:[:index, :show, :edit, :update, :destroy] do
    member do
      get :favorites
      get :bookmarks
    end
    resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
  end

  resources :ranks, only:[:index]

  root to: "home#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'search' => 'searches#search'

  resources :notifications, only: [:index, :destroy]
end
