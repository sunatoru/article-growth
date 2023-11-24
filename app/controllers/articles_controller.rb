class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @articles = Article.published.order(updated_at: :desc).page(params[:page]).per(10)
  end

  def drafts
    @drafts = Article.where(status: 'draft').order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if params[:draft] == 'true'
      @article.status = 'draft'
    elsif params[:published] == '投稿'
      @article.status = 'published'
    end

    if @article.save
      if @article.status == 'draft'
        redirect_to drafts_path, notice: '記事が下書き保存されました。'
      else
        redirect_to root_path, notice: '記事が公開されました。'
      end
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image, :status).merge(user_id: current_user.id)
  end
end
