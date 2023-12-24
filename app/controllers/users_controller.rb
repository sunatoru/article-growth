class UsersController < ApplicationController
  before_action :set_user

  def likes
    likes = Like.where(user_id: @user.id).pluck(:article_id)
    @like_articles = Article.where(id: likes).page(params[:page]).per(10)
  end

  def show
    likes = Like.where(user_id: @user.id).pluck(:article_id)
    @like_articles = Article.where(id: likes)
                            .limit(10)  # 10件までに制限
                            .page(params[:page])
                            .per(10)

    @drafts = Article.where(status: 'draft', user: current_user)
                     .includes(:user)
                     .order(updated_at: :desc)
                     .limit(5)  # 5件までに制限
                     .page(params[:page])
                     .per(5)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
