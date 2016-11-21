Rails.application.routes.draw do
  devise_for :users, controllers: {
  	registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#index'
  resources :provinces, only: [:index] do
  	resources :amphurs, only: [:index]
  end

  resources :amphurs, only: [:show] do
  	resources :districts, only: [:index]
  end

  resources :districts, only: [:show] do
  	resources :zipcodes, only: [:index]
  end
end
