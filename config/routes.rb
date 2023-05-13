Rails.application.routes.draw do




  devise_for :users

  get "ping", to: "debug#index"
  get "ping_admin", to: "debug#admin"

  resources :main
  resources :actors
  resources :categories
  resources :genres
  resources :movie_shorts
  resources :movies
  resources :rating_stars
  resources :ratings
  resources :reviews

  root "main#index"
end
