Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :articles, only: [:index, :show, :new, :create]
  get '/articles/drafts', to: 'articles#drafts', as: 'drafts_articles'
  get '/articles/drafts/:id', to: 'articles#draft_show', as: 'draft_article'
end
