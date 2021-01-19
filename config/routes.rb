Rails.application.routes.draw do
  get '/', to: "notes#index"
  resources :notes 
  resources :profile

  devise_for :admins, skip: [:registrations]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
