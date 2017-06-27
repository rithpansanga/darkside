Rails.application.routes.draw do

root 'pages#main'

get 'darkside', to:'pages#dark'

resources :leagues 
resources :teams
resources :homes
resources :aways
resources :matches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
