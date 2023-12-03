Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :articles do
    resource :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
    resources :comments, only: :create
  end
  get '/articles/drafts', to: 'articles#drafts', as: 'drafts_articles'
end
