Rails.application.routes.draw do
  get 'readings/index'

  get 'readings/show'

  get 'readings/new'

  get 'readings/edit'

  devise_for :users
  resources :announcements
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
