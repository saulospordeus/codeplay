Rails.application.routes.draw do
  root 'home#index'
  resources :courses, only: [:index, :show]
  resources :teachers, only: [:index, :new, :create]
end
