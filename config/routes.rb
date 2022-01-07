# frozen_string_literal: true

Rails.application.routes.draw do
  resources :ingredients
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get '/search/ingredients', to: 'ingredients#search'
  resources :dishes
  authenticated do
    root to: 'dishes#index', as: :authenticated_root
  end
  root 'dishes#index'
end
