class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  enum status: { published: 0, draft: 1 }

  validates :title, presence: true
  validates :content, presence: true

  # 画像が添付されているかどうかを確認するカスタムバリデーション
  validate :image_attached?, on: :create, if: -> { image.attached? }

  private

  def image_attached?
    errors.add(:image, 'must be attached') unless image.attached?
  end
end
