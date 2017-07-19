Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create, :show, :edit, :update]

  namespace :admin do
    resources :topics, only: [:index, :show, :new, :create, :edit, :update]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
