Rails.application.routes.draw do
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  devise_for :users, skip: [:registrations]
  root to: 'static#index'
end
