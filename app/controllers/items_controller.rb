class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order("created_at DESC") #並び替え
  end

  def new
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
  end

  def edit
    # ログインユーザーが出品者じゃない
    unless user_signed_in? && current_user.id == @item.user_id
    redirect_to root_path
    end

  end

  def update
    @item = Item.find(params[:id])
      if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:image,:name,:describe,:payment,:category_id,:condition_id,:fee_id,:area_id,:day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end
end
