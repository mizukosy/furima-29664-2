class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :move_to_show, only: [:edit, :update, :destroy]
  before_action :select_item, only: [:show, :edit, :update, :destroy]

  def index
    @item = Item.all.order('created_at DESC').includes(:user)
    @purchase = Purchase
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

  def show
    @message = Message.new
    @messages = @item.messages.includes(:user)
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path
    end
  end

  def search
    @item = Item.search(params[:keyword]) 
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def move_to_show
    @item = Item.find(params[:id])
    redirect_to action: :show if current_user.id != @item.user_id
  end

  def item_params
    params.require(:item).permit(
      :name, :text, :category_id, :status_id, :price, :image,
      :delivery_chager_id, :prefecture_id, :delivery_days_id
    ).merge(user_id: current_user.id)
  end

  def select_item
    @item = Item.find(params[:id])
  end
end
