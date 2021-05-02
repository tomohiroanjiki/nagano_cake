class Admin::OrdersController < ApplicationController
  def show
    @sum = 0
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    p @order.shipping

  end

  def update
  end

end
