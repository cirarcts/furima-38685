class ItemsController < ApplicationController
  def index
    @items = item.order("created_at DESC")
  end

  def new
  end
end
