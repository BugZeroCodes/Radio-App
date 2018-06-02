Rails.application.routes.draw do
  resources :readings

  devise_for :users
  resources :announcements
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
