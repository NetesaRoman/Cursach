Rails.application.routes.draw do


  devise_for :users

  get "ping", to: "debug#index"

  resources :main


  root "main#index"
end
