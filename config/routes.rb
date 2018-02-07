Rails.application.routes.draw do
  resources :posts, only: [:index]
  devise_for :users
  root to: 'static#index'
end
