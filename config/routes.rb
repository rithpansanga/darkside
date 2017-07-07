Rails.application.routes.draw do

root 'pages#main'

get 'darkside', to:'pages#dark'
get 'test', to: 'pages#test'
get 'signup' , to:'users#new'
post 'users' , to: 'users#create'
resources :users, except: [:new]

get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'

resources :leagues 
resources :teams
resources :homes
resources :aways
resources :matches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
