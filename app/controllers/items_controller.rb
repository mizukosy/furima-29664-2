class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new]

  def index
    # @item = Item.new(item_params)
  end

  def new
    @category = Item.new
  end


  private

  def move_to_index
    unless user_sign_in?
      redirect_to action: :index
    end
  end

  def item_params
    # params.require(:item).permit(
    #   :name, :text, :genre_id, :status_id, :price,
    #   :delivery_charger_id, :delivery_area_id, :delivery_days_id, :user
    # )
  end

end