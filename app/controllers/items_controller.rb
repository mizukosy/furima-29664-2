class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new]

  def index
    # @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path(@item)
    else
      render :new
    end
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(
      :name, :text, :category_id, :status_id, :price, :image,
      :delivery_chager_id, :delivery_area_id, :delivery_days_id, :user
    ).merge( user_id:current_user.id)
  end
end