class ArticlesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc).limit(15)
  end
  
  def new
  end


end
