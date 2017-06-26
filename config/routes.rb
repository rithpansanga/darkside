Rails.application.routes.draw do

root 'pages#main'
get 'home', to: 'pages#home'
resources :leagues 
resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
