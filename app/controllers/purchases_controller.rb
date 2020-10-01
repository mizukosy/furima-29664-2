class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :select_item, only: [:index, :create]
  before_action :check_user_id

  def index
    @order = ItemOrder.new
  end

  def create
    @order = ItemOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:item_order).permit(:post_code, :prefecture_id, :city, :block, :building, :telephone).merge(
      token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: @order.token,
      currency: 'jpy'
    )
  end

  def select_item
    @item = Item.find(params[:item_id])
  end

  def check_user_id
    if (current_user.id == @item.user_id) || ( @item.purchase != nil )
      redirect_to root_path
    end
  end
end
