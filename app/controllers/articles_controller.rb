class ArticlesController < ApplicationController
  def index
    @articles = Article.order(updated_at: :desc).page(params[:page]).per(15)

  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
 

  private
  def article_params
    params.require(:article).permit(:title, :content, :image).merge(user_id: current_user.id)
  end
end
