Rails.application.routes.draw do



  devise_for :users

  get "ping", to: "debug#index"

  resources :main
  resources :actors
  resources :categories
  resources :genres
  resources :movie_shorts
  resources :movies
  resources :rating_stars
  resources :rating
  resources :reviews

  root "main#index"
end
