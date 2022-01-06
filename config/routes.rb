Rails.application.routes.draw do
  resources :ingredients
  devise_for :users
  resources :dishes
  authenticated do
    root to: "dishes#index", as: :authenticated_root
  end
  root "dishes#index"
end
