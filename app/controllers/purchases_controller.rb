class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchases = Purchase.new(purchase_params)
    if @Purchase.valid?
      @purchase.save
      return redirect_to roor_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:current_user.id).merge(token: params[:token])
  end

  def item_params
    params.permit(:price, :item.id).marge(user_id: user.id)
  end

  def ship_address_params
    params.permit(:post_code, :prefecture, :city, :block, :building, :telephone, :purchase).marge(purchase_id: purchase.id)
  end

end
