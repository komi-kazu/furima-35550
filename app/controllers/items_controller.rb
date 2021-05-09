class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:name,:explain,:category_id,:condition_id,:delivery_fee,:prefecture_id,:sending_days,:selling_price,:image).merge(user_id: current_user.id)
  end
end
