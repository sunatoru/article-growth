require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザーの新規登録' do
    context 'ユーザー新規登録ができる場合' do
      it 'name,e-mail,password,password_confirmationをきちんと入力した時、ユーザーが保存される' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー新規登録ができない場合' do
      it 'nameが入力されていない場合' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'ユーザー名を入力してください'
      end
      it 'e-mailが入力されていない場合' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールを入力してください'
      end
      it 'passwordが入力されていない場合' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードを入力してください'
      end
      it 'password_confirmationがされていない場合' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it 'nameが2文字以下の場合' do
        @user.name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include 'ユーザー名は2文字以上で入力してください'
      end
      it 'e-mailに@が含まれていない場合' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
      end
      it 'passwordとpassword_confirmationが一致しない場合' do
        @user.password = '11111da'
        @user.password_confirmation = 'test111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 130, max_length: 150)
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは128文字以内で入力してください'
      end
    end
  end
end
