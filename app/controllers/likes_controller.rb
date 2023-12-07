class LikesController < ApplicationController
  before_action :set_article
  def create
    if current_user && current_user != @article.user
      like = current_user.likes.build(article_id: params[:article_id])
      like.save
      # リクエストを送信した元のページのURLを表します。
      redirect_to request.referer
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    like = Like.find_by(article_id: params[:article_id], user_id: current_user.id)
    like.destroy
    # リクエストを送信した元のページのURLを表します。
    redirect_to request.referer
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
