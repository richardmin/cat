Rails.application.routes.draw do
  devise_for :users
   get 'users/new'
  root 'application#hello'
end
