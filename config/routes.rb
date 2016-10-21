Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  devise_for :users
   get 'users/new'
  root 'application#hello'
end
