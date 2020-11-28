require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスは、@を含む必要があること" do
      @user.email = "testtest"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordは数字のみでは登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordは英語のみでは登録できないこと" do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordは全角では登録できないこと" do
      @user.password = "ああああああ"
      @user.password_confirmation = "ああああああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.familyname = nil
      @user.firstname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Familyname can't be blank", "Familyname is invalid", "Firstname can't be blank", "Firstname is invalid")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.familyname = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Familyname is invalid")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.firstname = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname is invalid")
    end

    it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user.familykana = nil
      @user.firstkana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Familykana can't be blank", "Familykana is invalid", "Firstkana can't be blank", "Firstkana is invalid")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.familykana = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Familykana is invalid")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.firstkana = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstkana is invalid")
    end

    it "生年月日が必須であること" do
      @user.birth = "123456"
      @user.birth = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end

    


  end
end

