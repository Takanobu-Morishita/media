Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :posts, only:[:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :favorites, only: %i[create destroy]
    resources :bookmarks, only: %i[create destroy]
  end
  resources :users, only:[:index, :show, :edit, :update, :destroy] do
    member do
      get :favorites
      get :bookmarks
    end
  end

  root to: "home#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'search' => 'searches#search'
end
