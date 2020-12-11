require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_form = FactoryBot.build(:buy_form, user_id: user.id, item_id: item.id)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buy_form).to be_valid
    end

    #空だと〜〜できない
    it 'tokenが空だと保存できないこと' do
      @buy_form.token = nil
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Token can't be blank")
    end
    it 'postaが空だと保存できないこと' do
      @buy_form.posta= nil
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Posta can't be blank")
    end
    it 'areaが空だと保存できないこと' do
      @buy_form.area = nil
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Area can't be blank")
    end   
    it 'cityが空だと保存できないこと' do
      @buy_form.city = nil
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("City can't be blank")
    end    
    it 'banchiが空だと保存できないこと' do
      @buy_form.banchi = nil
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Banchi can't be blank")
    end    
    it 'phonenumberが空だと保存できないこと' do
      @buy_form.phonenumber = nil
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Phonenumber can't be blank")
    end


    #郵便番号
    it 'postaが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buy_form.posta = '1234567'
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Posta is invalid")
    end
    
    #電話番号
    it "phonenumberが12桁以上であれば登録できないこと" do
      @buy_form.phonenumber = "123454567890123"
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Phonenumber is invalid")
    end

    it "areaは1だと登録できない" do
      @buy_form.area = 1
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Area must be other than 1")
    end

    it "phonenumberは数字のみでは登録できないこと" do
      @buy_form.phonenumber = "123-5678-90"
      @buy_form.valid?
      expect(@buy_form.errors.full_messages).to include("Phonenumber is invalid")
    end

  end
end