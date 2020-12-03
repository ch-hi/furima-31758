class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC") #並び替え
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    # redirect_to "/items/#{item.id}"  # コメントと結びつくツイートの詳細画面に遷移する
  end
  
  private

  def item_params
    params.require(:item).permit(:image,:name,:describe,:payment,:category_id,:condition_id,:fee_id,:area_id,:day_id).merge(user_id: current_user.id)
  end  
end
