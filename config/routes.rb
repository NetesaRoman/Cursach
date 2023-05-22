Rails.application.routes.draw do

  devise_for :users

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

  root "movies#index"
end
