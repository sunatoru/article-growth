class CommentChannel < ApplicationCable::Channel
  def subscribed
    @article = Article.find(params[:article_id]) # 追記
    stream_for @article # 追記
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
