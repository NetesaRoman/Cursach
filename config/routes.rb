Rails.application.routes.draw do

  devise_for :users

  get "ping", to: "debug#index"
  get "ping_admin", to: "debug#admin"

  resources :main
  resources :actors
  resources :categories
  resources :genres
  resources :directors
  resources :movie_shorts
  resources :movies do
    member do
      post 'like', to: 'movies#like'
      post 'dislike', to: 'movies#dislike'
      post 'reviews', to: 'reviews#create', as: :create_review
    end
  end

  resources :reviews

  root "main#index"
end
