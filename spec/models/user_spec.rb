require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      binding.pry
    end
    it "emailが空では登録できない" do
    end
  end

end



# メールアドレスが必須であること
# メールアドレスは、@を含む必要があること
# パスワードが必須であること
# パスワードは、6文字以上での入力が必須であること
# パスワードとパスワード（確認用）、値の一致が必須であること
# ニックネームが必須であること
# ユーザー本名は、名字と名前がそれぞれ必須であること
# ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること
# 生年月日が必須であること