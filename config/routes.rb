# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dishes#index'
  resources :dishes
  resources :ingredients
  get '/search/ingredients', to: 'ingredients#search'
  get 'my_dishes', to: 'dishes#my_dishes'
  resources :users
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  authenticated do
    root to: 'dishes#index', as: :authenticated_root
  end
end
