Rails.application.routes.draw do
  root 'home#index'
  resources :instructors
  resources :courses do
   resources :lessons
  end
end
