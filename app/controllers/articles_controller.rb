class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  protect_from_forgery with: :exception
  def index
    @articles = Article.published.order(updated_at: :desc).page(params[:page]).per(10)
  end

  def drafts
    @drafts = Article.where(status: 'draft').order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    if params[:id] == 'drafts'
      show_drafts
    else
      show_article
    end
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
        redirect_to drafts_articles_path, notice: '記事が下書き保存されました。'
      else
        redirect_to root_path, notice: '記事が公開されました。'
      end
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if params[:draft].present?
      @article.status = :draft
      redirect_path = drafts_articles_path
      notice_message = '下書きを保存しました。'
    else
      @article.status = :published
      redirect_path = article_path(@article)
      notice_message = '投稿を更新しました。'
    end

    if @article.update(article_params)
      redirect_to redirect_path, notice: notice_message
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image, :status).merge(user_id: current_user.id)
  end

  def show_drafts
    if user_signed_in?
      @drafts = Article.where(status: 'draft', user: current_user).order(created_at: :desc).page(params[:page]).per(10)
      render 'drafts'
    else
      redirect_to root_path, alert: 'ログインしていません。'
    end
  end

  def show_article
    @article = Article.find(params[:id])

    if !@article.draft?
      render :show
    else
      redirect_to root_path, alert: 'この記事は閲覧できません。'
    end
  end
end
