require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  describe 'コメントができる時' do
    context 'コメントが記事にできる場合' do
      it 'ログインユーザーでコメントにtextを入力した場合コメントできる' do
        expect(@comment).to be_valid
      end
    end
  end
  describe 'コメントができない場合' do
    context 'コメントが記事にできない場合' do
      it 'ログインしていない場合コメントできない' do
        logged_out_user = nil
        @comment.user = logged_out_user
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Userを入力してください"
      end
    end
    context 'コメントが記事にできない場合' do
      it '記事がない場合コメントができない' do
        @comment.article = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Articleを入力してください"
      end
    end
  end
end
