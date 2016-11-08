Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  
  get '/join_game', to: 'static_pages#join_game'
  resources :users, :only => [:show]
  resources :teams, only: [:new]
  
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
    get "/sign_up" => "devise/registrations#new"
    get "/edit" => "devise/registrations#edit"
  end
 
  resources :comments, only: [:new, :create, :index]
end
