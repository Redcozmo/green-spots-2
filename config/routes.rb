Rails.application.routes.draw do
  get 'taxons/new'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index'
  root 'home#index'
  get 'home/landing', to: 'home#landing'

  get 'spots/:id/show_map', to: 'spots#show_map', as: 'spots/show_map'
  get 'spots/map', to: 'spots#map'
  get 'trees/map', to: 'trees#map'
  get 'spots/map_test', to: 'spots#map_test'
  get 'spots/geoloc', to: 'spots#geoloc'

  resources :spots, :trees, :taxons
end
