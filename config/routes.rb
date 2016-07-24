Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :people
  get 'pages/welcome'

  root 'pages#welcome'
end
