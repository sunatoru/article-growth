class LikesController < ApplicationController
  before_action :set_article
  def create
    like = current_user.likes.build(article_id: params[:article_id])
    like.save
    respond_to(&:js)
  end

  def destroy
    like = Like.find_by(article_id: params[:article_id], user_id: current_user.id)
    like.destroy
    respond_to(&:js)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
