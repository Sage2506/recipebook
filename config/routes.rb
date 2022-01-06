Rails.application.routes.draw do
  resources :ingredients
  devise_for :users
  resources :dishes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dishes#index"
end
