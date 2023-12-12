class UsersController < ApplicationController
  before_action :set_user

  def likes
    likes = Like.where(user_id: @user.id).pluck(:article_id)
    @like_articles = Article.find(likes)
  end


  def show
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
