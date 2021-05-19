Rails.application.routes.draw do
  root 'home#index'
  resources :courses, only: [:index, :show, :new, :create, :edit, :update]
  resources :instructors, only: [:index, :new, :create, :show, :edit, :update, :delete, :destroy]
end
