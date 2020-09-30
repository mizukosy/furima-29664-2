class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order = ItemOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = ItemOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.create
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:item_order).permit(:user_id, :item_id, :post_code, :prefecture_id, :city,
                                       :block, :building, :telephone).merge(token: params[:token], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: @order.token,
      currency: 'jpy'
    )
  end

end