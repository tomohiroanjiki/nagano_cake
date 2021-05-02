class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def update
    @item = Item.finde(params[:id])
    @item.update(item_params)
    render :show
  end
end

private

def item_params
  params.require(:item).permit(:name)
end
