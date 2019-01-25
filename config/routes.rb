Rails.application.routes.draw do
  get 'spots/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index'
  root 'home#index'

  resources :spots
end
