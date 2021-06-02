Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users, only: %i[show]

  resources :instructors

  namespace :admin do
    resources :courses do
      resources :lessons
      end
  end


  resources :courses, only: [:show] do
    resources :lessons
    post 'enroll', on: :member
    get 'my_courses', on: :collection
  end
end