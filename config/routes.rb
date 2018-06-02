Rails.application.routes.draw do
  resources :readings, except: [:new, :create]

  devise_for :users
  resources :announcements do
    member do
      get 'readings/new', as: 'new_reading'
      post 'readings' => 'readings#create'
    end
  end
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
