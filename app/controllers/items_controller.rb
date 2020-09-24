class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(
      :name, :text, :category_id, :status_id, :price, :image,
      :delivery_chager_id, :delivery_area_id, :delivery_days_id
    ).merge(user_id: current_user.id)
  end
end
