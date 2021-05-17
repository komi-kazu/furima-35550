class StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_top_page

  def index
    @item = Item.find(params[:item_id])
    
    @store_shipping = StoreShipping.new
  end

  def create
    @store_shipping = StoreShipping.new(store_params)
    if @store_shipping.valid?
      pay_item
      @store_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

private

  def store_params
    @item = Item.find(params[:item_id])
    params.require(:store_shipping).permit(:postal,:prefecture_id,:municipality,:address,:building_name,:phone_number,).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def move_to_top_page
    @item = Item.find(params[:item_id])
    if current_user.id ==  @item.user.id || @item.store.present?
      redirect_to root_path
    end
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: store_params[:token],
      currency: 'jpy'
    )
  end

end
