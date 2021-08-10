require 'rails_helper'

RSpec.describe User, type: :model do

  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録できる時' do
      it '全ての項目を適切に入力すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが英数混合で6文字以上かつpassword_confirmationと一致しているなら登録できる' do
        @user.password = 'password1'
        @user.password_confirmation = "#{@user.password}"
        expect(@user).to be_valid
      end
      it 'last_nameとfirst_nameが全角かなカナ漢字なら登録できる' do
        @user.last_name = '田中たなかタナカ'
        @user.first_name = '太郎たろうタロウ'
        expect(@user).to be_valid
      end
      it 'last_name_kanaとfirst_name_kanaが全角カタカナなら登録できる' do
        @user.last_name_kana = 'タナカー'
        @user.first_name_kana = 'タロウー'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
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
      it 'emailは@を含まなければ登録出来ない' do
        @user.email = 'name.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'emailは重複して登録出来ない' do
        @user1 = FactoryBot.create(:user)
        @user.email = "#{@user1.email}"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが英数混合でも6文字未満では登録できない' do
        @user.password = 'pass1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが6文字以上でも英字のみでは登録できない' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが6文字以上でも数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'password_confirmationがpasswordと一致していなければ登録出来ない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角(かなカナ漢字)でなければ登録出来ない' do
        @user.last_name = 'ｱｶﾏﾂ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角(かなカナ漢字)でなければ登録出来ない' do
        @user.first_name = 'ﾚﾉﾝ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが全角(カナ)でなければ登録出来ない' do
        @user.last_name_kana = 'ｱｶﾏﾂ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが全角(カナ)でなければ登録出来ない' do
        @user.first_name_kana = 'ﾚﾉﾝ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
