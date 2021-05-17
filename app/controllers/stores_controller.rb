class StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_top_page

  def index
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
    params.require(:store_shipping).permit(:postal,:prefecture_id,:municipality,:address,:building_name,:phone_number,).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def move_to_top_page
    if current_user.id ==  @item.user.id || @item.store.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: store_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
