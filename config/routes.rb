Rails.application.routes.draw do
  resources :posts, only: [:index, :new, :create, :show, :edit, :update]
  devise_for :users
  root to: 'static#index'
end
