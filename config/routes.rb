 Rails.application.routes.draw do
  resources :audit_logs
  namespace :admin do
    resources :users
    resources :posts
    resources :admin_users

    root to: "users#index"
  end

  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  devise_for :users, skip: [:registrations]
  root to: 'static#index'
end
