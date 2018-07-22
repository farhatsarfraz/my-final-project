Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  namespace :api, defaults: { format: :json } do
    as :user do
      post   "/sign-in"       => "sessions#create"
      delete "/sign-out"      => "sessions#destroy"
    end
    namespace :v1 do
      resources :users, :only => [:show, :create]
    end
  end

  devise_for :users, controllers: { :invitations => 'users/invitations' }, skip: [:registrations]

  devise_scope :users do
    get 'login', to: 'devise/sessions#new'
  end

  resources :pages

  root to: 'pages#index'
  resources :buses
  resources :users

  resources :stops
  resources :routes

end
