require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = User.create(name: 'コマー', email: 'john@example.com', password: 'password')
    article = FactoryBot.create(:article, user: @user)
    @login_user = User.create(name: 'どい', email: 'jane@example.com', password: 'password1111') # ログインユーザーを別に作成
    @like = FactoryBot.build(:like, user_id: @login_user.id, article_id: article.id)
  end

  describe 'いいねについて' do
    context 'いいねができる場合' do
      it '記事投稿者本人ではなくかつログインユーザーならいいねができる' do
        expect(@like).to be_valid
      end
    end
    context 'いいねができない場合' do
      it '記事の投稿者=いいねするユーザーだったらいいねできない' do
        @like.user_id = @user.id 
        @like.valid?
        expect(@like.errors.full_messages).to include "記事の所有者はいいねできません"
      end
      it '記事に紐づいてないといいねできない' do
        @like.article_id = nil 
        @like.valid?
        expect(@like.errors.full_messages).to include "Articleを入力してください"
      end
      it 'user_idに紐づいてないといいねできない' do
        @like.user_id = nil
        @like.valid?
        expect(@like.errors.full_messages).to include "ユーザーIDが空です"
      end
    end
  end
end
