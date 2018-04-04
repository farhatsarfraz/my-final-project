Rails.application.routes.draw do
  devise_for :users 
  
  devise_scope :users do
  get 'login', to: 'devise/sessions#new'
  end

  resources :pages

  root to: 'pages#index'
  resources :buses
  resources :stops
  resources :routes
end
