class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]


  def index
    @buy_form = BuyForm.new
    # binding.pry
    if @item.user_id == current_user.id || @item.buy != nil
       redirect_to root_path
    end
  end

 
  def create
    @buy_form = BuyForm.new(buy_params)      
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
    
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.payment,  
        card: buy_params[:token],  
        currency: 'jpy'                
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
 
  
  end
