Rails.application.routes.draw do
  resources :notes 
  resources :profile

  get '/user/:nickname', to: 'profile#index'

  devise_for :admins, skip: [:registrations]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
