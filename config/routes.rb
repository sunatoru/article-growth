Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :tweets, only: :index
end
