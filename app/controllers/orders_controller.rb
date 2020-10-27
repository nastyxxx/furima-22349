class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :move_to_show

  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:item_order).permit(
      :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_show
    redirect_to root_path if current_user.id == @item.user_id
  end
end
