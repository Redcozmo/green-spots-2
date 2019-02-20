Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index'
  root 'home#index'

  get 'spots/map', to: 'spots#map'
  get 'spots/map_test', to: 'spots#map_test'
  get 'spots/geoloc', to: 'spots#geoloc'

  resources :spots

  resources :trees
end
