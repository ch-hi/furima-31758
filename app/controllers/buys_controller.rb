class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @buy_form = BuyForm.new
  end

 
  def create
    
    # binding.pry
    @item = Item.find(params[:item_id])
    # binding.pry
    # binding.pry(params no nakami) => token ga haitteiru => ok
    @buy_form = BuyForm.new(buy_params)   #「BuyForm」に編集
    # binding.pry
     if @buy_form.valid?
      pay_item
      @buy_form.save
       redirect_to root_path
     else
       render action: :index
     end
  end
 
  private
  def buy_params
   params.require(:buy_form).permit(:posta, :area, :city, :banchi, :building, :phonenumber, :price).merge(user_id: current_user.id,token: params[:token],item_id: params[:item_id])
  end

  def pay_item
    # Payjp.api_key = "pk_test_cf3a19d0219f760b8bce012c"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.payment,  # 商品の値段
        card: buy_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
  
  end
