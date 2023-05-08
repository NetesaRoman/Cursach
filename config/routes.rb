Rails.application.routes.draw do
  get 'reviews/show'
  get 'reviews/new'
  get 'reviews/index'
  get 'reviews/edit'
  get 'rating/show'
  get 'rating/new'
  get 'rating/index'
  get 'rating/edit'
  get 'movie_shorts/show'
  get 'movie_shorts/new'
  get 'movie_shorts/index'
  get 'movie_shorts/edit'
  get 'movies/show'
  get 'movies/new'
  get 'movies/index'
  get 'movies/edit'
  get 'categories/show'
  get 'categories/new'
  get 'categories/index'
  get 'categories/edit'
  get 'actors/show'
  get 'actors/new'
  get 'actors/index'
  get 'actors/edit'
  get 'genres/show'
  get 'genres/new'
  get 'genres/index'
  get 'genres/edit'


  devise_for :users

  get "ping", to: "debug#index"

  resources :main


  root "main#index"
end
