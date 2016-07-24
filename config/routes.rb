Rails.application.routes.draw do
  resources :people
  get 'pages/welcome'

  root 'pages#welcome'
end
