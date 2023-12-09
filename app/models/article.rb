class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_one_attached :image
  enum status: { published: 0, draft: 1 }

  validates :title, presence: { message: 'はタイトルを入力してください' }
  validates :content, presence: { message: 'は内容を入力してください' }

  # 画像が添付されているかどうかを確認するカスタムバリデーション
  validate :image_attached?, on: :create, if: -> { image.attached? }

  def self.ransackable_attributes(_auth_object = nil)
    %w[title content]
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  private

  def image_attached?
    errors.add(:image, 'must be attached') unless image.attached?
  end
end
