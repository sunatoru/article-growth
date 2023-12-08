class Like < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validate :cannot_like_own_article, on: [:create, :destroy]
  validate :user_must_be_registered, on: [:create, :destroy]

  private

  def cannot_like_own_article
    if article.present? && user_id == article.user_id
      errors.add(:base, "記事の所有者はいいねできません")
    elsif article.blank? 
      errors.add(:base, "記事が存在しないためいいねできません")
    end
  end

  def user_must_be_registered
    if user_id.blank?
      errors.add(:base, "ユーザーIDが空です")
    elsif !User.exists?(user_id)
      errors.add(:base, "ユーザーが存在しないためいいねできません")
    end
  end
end
