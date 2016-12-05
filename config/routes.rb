Rails.application.routes.draw do
  resources :users do
    resources :articles
  end

  namespace :articles do
    resources :comments
  end

  resources :sessions, only: [:new, :create]
  #  breaking convention here with the following line, because sessions are not conventional by nature
  delete 'sessions' => 'sessions#destroy'

  root 'articles#index'
end
