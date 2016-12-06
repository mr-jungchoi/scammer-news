Rails.application.routes.draw do
  resources :users do
    resources :articles, except: :show
  end

  resources :articles, only: [:index, :show] do
    resources :comments
  end

  #  breaking convention here with the following line, because sessions are not conventional by nature
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#login'
  delete '/logout' => 'sessions#logout'

  root 'articles#index'
end
