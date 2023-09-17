Rails.application.routes.draw do
  devise_for :users
  resources :posts, only:[:index, :show, :new, :create, :edit, :update] do
    resources :favorites, only: %i[create destroy]
    collection do
      get :favorites
    end
  end
  resources :users, only:[:index, :show, :new, :create, :edit, :update]

  root to: "home#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
