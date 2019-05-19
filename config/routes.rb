Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  root to: 'top#show'

  devise_scope :user do
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/user/:id', to: redirect('/users/')
  end
  resources :users, only: [:index, :show]
  resources :messages, only: :create
end
