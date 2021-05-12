Rails.application.routes.draw do
  get '/', to: 'home#index', as: 'root'
end
