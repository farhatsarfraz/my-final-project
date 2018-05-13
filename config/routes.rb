Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    as :user do
      post   "/sign-in"       => "sessions#create"
      delete "/sign-out"      => "sessions#destroy"
    end
    namespace :v1 do
      resources :users, :only => [:show, :create]
    end
  end

  devise_for :users

  devise_scope :users do
    get 'login', to: 'devise/sessions#new'
  end

  resources :pages

  root to: 'pages#index'
  resources :buses do
    resources :comments, olny: [:create]
  end
  resources :users

  resources :stops
  resources :comments, only: [:create]
  resources :routes
  resources :messages
  mount ActionCable.server => '/cable'
  get '/chat', to: 'chatrooms#show'

end
