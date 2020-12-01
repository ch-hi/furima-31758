require 'rails_helper'

RSpec.describe Item, type: :model do
    describe  '#create'  do
      before do
        @item = FactoryBot.build(:item)
      end

          it "商品画像が空では登録できない" do
            @item.image = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Payment is not a number")
          end

          it "商品名が空だと登録できないこと" do
            @item.name = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Name can't be blank")
          end

          it "商品の説明が空だと登録できないこと" do
            @item.describe = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Describe can't be blank")
          end

          it "category_idは1だと登録できない" do
            @item.category_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Category is not a number")
          end

          it "condition_idは1だと登録できない" do
            @item.condition_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Condition is not a number")
          end

          it "fee_idは1だと登録できない" do
            @item.fee_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Fee is not a number")
          end

          it "area_idは1だと登録できない" do
            @item.area_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Area is not a number")
          end

          it "day_idは1だと登録できない" do
            @item.day_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Day is not a number")
          end

          it "価格についての情報が空だと場合登録できない" do
            @item.payment = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Payment can't be blank")
          end      

          it "価格が、¥300以上であること" do
            @item.payment = "299"
            @item.valid?
            expect(@item.errors.full_messages).to include("Payment must be greater than or equal to 300")
          end     
          
          it "価格が、¥9,999,999以下であること" do
            @item.payment = "10_000_000"
            @item.valid?
            expect(@item.errors.full_messages).to include("Payment must be less than or equal to 9999999")
          end     

          it "販売価格は半角数字での入力が必須であること" do
            @item.payment = "３３３"
            @item.valid?
            expect(@item.errors.full_messages).to include("Payment is not a number")
          end      

          it "必要な情報を適切に入力すると、商品の出品ができること(紐づくユーザーが存在しないと保存できないこと)" do
            @item.user = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("User must exist")
          end      
    end
end    