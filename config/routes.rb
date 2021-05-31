Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users, only: %i[show]

  resources :instructors

  resources :courses do
    resources :lessons
    post 'enroll', on: :member
    get 'my_courses', on: :collection
  end
end