Rails.application.routes.draw do
  resources :users do
    resources :articles
  end

  namespace :articles do
    resources :comments
  end

  resources :sessions, only: [:new, :create, :destroy]

  root 'articles#index'
end
