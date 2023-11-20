class ArticlesController < ApplicationController
  def index
    @articles = Article.order(updated_at: :desc).page(params[:page]).per(15)

  end
  
  def new
  end


end
