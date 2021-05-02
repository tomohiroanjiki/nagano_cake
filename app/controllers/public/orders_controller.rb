class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @order = Order.new
    @address = Address.all
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)

    @order.shipping = 800
    if @order.delivery_address == 'ご自身の住所'
      @order.postal_code = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.full_name = current_customer.last_name
    elsif @order.delivery_address == '登録済みの住所から選択'

    else
      @order.delivery_address = params[:order][:address]
      @order.full_name = params[:order][:name]
    end
  end

  def complete
  end

  def create
    @order = Order.new
    if params[:order][:payment_method] == "銀行振込"
      @order.payment_method = 1
    elsif params[:order][:payment_method] == "クレジットカード"
      @order.payment_method = 0
    end
    @order.postal_code = params[:order][:postal_code]
    @order.delivery_address = params[:order][:delivery_address]
    @order.full_name = params[:order][:full_name]
    @order.shipping = 800
    @order.billing_amount = params[:order][:billing_amount]
    @order.customer_id = current_customer.id
    @order.save

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      order_item = OrderItem.new
      order_item.item_id = cart_item.item_id
      order_item.amount = cart_item.amount
      order_item.price = (cart_item.item.price * 1.1).round
      order_item.order_id = @order.id

      order_item.save
      cart_item.destroy
    end
    redirect_to oders_complete_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = current_customer.orders.find(params[:id])
    @order_items = @order.order_items
    # binding.pry
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :delivery_address, :postal_code, :full_name)
  end

end
