class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  private

  def item_params
    params.require(:item).permit(:name,:explain,:category_id,:condition_id,:delivery_fee_id,:prefecture_id,:sending_days_id,:selling_price,:image).merge(user_id: current_user.id)
  end
end
