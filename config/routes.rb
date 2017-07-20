Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create, :show, :edit, :update]

  namespace :admin do
    resources :topics
    resources :users, only: [:index, :edit, :update, :show, :destroy]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
