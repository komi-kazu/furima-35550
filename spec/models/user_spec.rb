require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが半角英数字混合の6文字以上であれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
      it 'last_nameが全角漢字であれば登録できる' do
        @user.last_name = '山田'
        expect(@user).to be_valid
      end
      it 'last_nameが全角ひらがなであれば登録できる' do
        @user.last_name = 'やまだ'
        expect(@user).to be_valid
      end
      it 'last_nameが全角カタカナであれば登録できる' do
        @user.last_name = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'first_nameが全角漢字であれば登録できる' do
        @user.first_name = '次郎'
        expect(@user).to be_valid
      end
      it 'first_nameが全角ひらがなであれば登録できる' do
        @user.first_name = 'じろう'
        expect(@user).to be_valid
      end
      it 'first_nameが全角カタカナであれば登録できる' do
        @user.first_name = 'ジロウ'
        expect(@user).to be_valid
      end
      it 'last_name_kanaが全角カタカナであれば登録できる' do
        @user.last_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角カタカナであれば登録できる' do
        @user.first_name_kana = 'ジロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'emailに@が含まれなけれは登録できない' do
        @user.email = 'tanakagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'last_nameが半角英字では登録できない' do
        @user.last_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角漢字ひらがなカタカナを使用してください")
      end
      it 'first_nameが半角英字では登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角漢字ひらがなカタカナを使用してください")
      end
      it 'last_name_kanaが半角英字では登録できない' do
        @user.last_name_kana = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
      end
      it 'last_name_kanaが全角漢字では登録できない' do
        @user.last_name_kana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
      end
      it 'last_name_kanaが全角ひらがなでは登録できない' do
        @user.last_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
      end
      it 'first_name_kanaが半角英字では登録できない' do
        @user.first_name_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
      end
      it 'first_name_kanaが全角漢字では登録できない' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
      end
      it 'first_name_kanaが全角ひらがなでは登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
      end
    end
  end
end
