class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :show_article, only: [:edit, :update, :destroy]
  def index
    @articles = Article.where(status: 'published').includes(:user).order(created_at: :desc).page(params[:page]).per(10)
  end

  def drafts
    @drafts = Article.where(status: 'draft').includes(:user).order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    if params[:id] == 'draft'
      show_drafts
    else
      show_article
      @comments = @article.comments.includes(:user)
      @comment = Comment.new
    end
  end

  def new
    @article = Article.new
  end

  def create
    @user = current_user
    @article = Article.new(article_params)
    @article.user_id = @user.id

    @article.status = if params[:draft_button].present?
                        :draft
                      else
                        :published
                      end

    if @article.save
      if @article.draft?
        redirect_to drafts_articles_path, notice: '記事が下書き保存されました。'
      else
        redirect_to root_path, notice: '記事が公開されました。'
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    return if @article.user == current_user

    redirect_to root_path, alert: '編集権限がありません。'
    nil
  end

  def update
    if params[:draft_button].present?
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
      render :edit, status: :unprocessable_entity
    end
  end

  def search
    @q = Article.ransack(params[:q])
    @articles = @q.result.includes(:user).order(updated_at: :desc).page(params[:page]).per(10)
  end

  def destroy
    unless @article.user == current_user
      redirect_to root_path, alert: '削除権限がありません。'
      return
    end

    is_draft = @article.draft?

    @article.destroy

    if is_draft
      redirect_to drafts_articles_path, notice: '下書き記事が削除されました。'
    else
      redirect_to root_path, notice: '記事が削除されました。'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image, :status).merge(user_id: current_user.id)
  end

  def show_drafts
    if user_signed_in?
      @drafts = Article.where(status: 'draft', user: current_user).order(created_at: :desc).page(params[:page]).per(10)
      render 'draft'
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def show_article
    @article = Article.find(params[:id])
  end
end
