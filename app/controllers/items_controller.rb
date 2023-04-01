class ItemsController < ApplicationController
  def index
    @items = item.order("created_at DESC")
  end

  def new
    
  end

  def create
    
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :image),merge(user_id: current_user.id)
  end
end
