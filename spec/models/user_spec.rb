require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '新規登録画面の全項目が存在すると登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在している場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが６文字以上であれば登録できること' do
      @user.password = '123456aa'
      @user.password_confirmation = @user.password
      expect(@user).to be_valid
    end

    it 'passwordが６文字未満では登録できないこと' do
      @user.password = '1234a'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが一致していないと登録できないこと' do
      @user.password = '12345aa'
      @user.password_confirmation = '12345bb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordは英語と数字が混同でなくては登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが全角であれば登録できること' do
      @user.first_name = '山田'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'last_nameが全角であれば登録できること' do
      @user.last_name = '太郎'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'first_nameが半角では登録できないこと' do
      @user.first_name = 'ｻｻｷ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end

    it 'last_nameが半角では登録できないこと' do
      @user.last_name = 'ｺｼﾞﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'last_name_kanaが空では登録できないこと' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが全角の片仮名であれば登録できること' do
      @user.first_name_kana = 'ヤマダ'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'last_name_kanaが全角の片仮名であれば登録できること' do
      @user.last_name_kana = 'タロウ'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'first_name_kanaが全角の片仮名以外であれば登録できないこと' do
      @user.first_name_kana = 'ｺｼﾞﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end

    it 'last_name_kanaが全角の片仮名以外であれば登録できないこと' do
      @user.last_name_kana = 'ｻｻｷ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
    end

    it '生年月日が空では登録できないこと' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
