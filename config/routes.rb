Rails.application.routes.draw do
  root 'home#index'
  resources :courses, only: [:index, :show, :new, :create]
  resources :teachers, only: [:index, :new, :create, :show, :edit, :update, :delete, :destroy]
end
