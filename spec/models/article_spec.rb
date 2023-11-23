require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end
  describe '新規記事が投稿' do
    context '記事が投稿できる場合' do
      it 'titleとcontentがあれば記事が投稿できる' do
        @article.image = nil
        expect(@article).to be_valid
      end
      it 'titleとcontentとimageがあれば記事が投稿できる' do
        expect(@article).to be_valid
      end
    end
    context '記事が投稿できない場合' do
      it 'titleがない場合記事が投稿できない' do
        @article.title = ""
        @article.valid?
        expect(@article.errors.full_messages).to include "Titleを入力してください"
      end
      it 'contentがない場合記事が投稿できない' do
        @article.content = ""
        @article.valid?
        expect(@article.errors.full_messages).to include "Contentを入力してください"
      end
      it 'userが紐づいていない場合記事が投稿できない' do
        @article.user = nil
        @article.valid?
        expect(@article.errors.full_messages).to include "Userを入力してください"
      end
    end
  end
end
