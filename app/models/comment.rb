class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :text, presence: { message: 'は文字を入力してください' }
end
