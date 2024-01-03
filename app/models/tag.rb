class Tag < ApplicationRecord
  has_many :article_tags, dependent: :destroy
  has_many :articles, through: :article_tags
  before_validation :downcase_name # 大文字と小文字の違いによる重複を回避するためのdowncase_nameメソッド
  validates :name, uniqueness: { case_sensitive: false }
  private

  def downcase_name
      self.name = name.downcase if name.present?
  end
end
