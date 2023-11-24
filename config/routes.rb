Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :articles, only: [:index, :new, :create]
  get '/articles/drafts', to: 'articles#drafts', as: 'drafts_articles'
end
