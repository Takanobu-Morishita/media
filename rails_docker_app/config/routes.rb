Rails.application.routes.draw do
  get 'posts/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'posts'     => 'posts#index'

  # Defines the root path route ("/")
  # root "articles#index"
end
