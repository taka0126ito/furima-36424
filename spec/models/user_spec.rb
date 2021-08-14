require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'NicknameとEmailとPasswordとPassword_confirmationとBirthdayとFirst_nameとLast_nameとFirst_name_kanaとLast_name_kanaが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end


    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordは半角英数字混合での入力がないと登録できないこと' do
      @user.password = '123456a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end

  it 'first_nameが空では登録できないこと' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
   end

  it 'first_nameが全角（漢字・ひらがな・カタカナ）での入力がないと登録できないこと' do
   @user.first_name = 'タナカ'
   @user.valid?
   expect(@user.errors.full_messages)
   end

  it 'first_name_kanaが空では登録できないこと' do
  @user.first_name_kana = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("First name kana can't be blank")
  end

  it 'first_name_kanaが全角（カタカナ）での入力がないと登録できないこと' do
    @user.first_name_kana = 'タナカ'
    @user.valid?
    expect(@user.errors.full_messages)
    end


    it 'last_nameが空では登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが全角（漢字・ひらがな・カタカナ）での入力がないと登録できないこと' do
        @user.last_name = 'タロウ'
        @user.valid?
        expect(@user.errors.full_messages)
        end

  it 'last_name_kanaが全角（カタカナ）での入力がないと登録できないこと' do
    @user.last_name_kana = 'タロウ'
    @user.valid?
    expect(@user.errors.full_messages)
    end

    it 'last_name_kanaが空では登録できないこと' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

  it 'passwordが5文字以下では登録できない' do
  @user.password = '00000'
  @user.password_confirmation = '00000'
  @user.valid?
  expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
 end
end

end