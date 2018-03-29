Rails.application.routes.draw do
  resources :posts, only: [:index, :new, :create, :show, :edit]
  devise_for :users
  root to: 'static#index'
end
