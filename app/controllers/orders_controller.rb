class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_order_shipping, only: [:index, :create]

  def index
    if current_user == @order_shipping.user || @order_shipping.order.present?
      redirect_to root_path
    else
      @order = OrderShipping.new(item_id: @order_shipping.id)
    end
  end

  def create
    @order = OrderShipping.new(order_params)
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
    params.require(:order_shipping).permit(:item_id, :user_id, :postal_code, :prefecture_id,
                                           :municipalities, :house_number, :building_name, :phone_number).merge(
                                             token: params[:token], user_id: current_user.id, item_id: params[:item_id]
                                           )
  end

  def set_order_shipping
    @order_shipping = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
