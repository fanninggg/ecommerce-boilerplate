class OrdersController < ApplicationController
  def new
    @basket = find_or_create_basket
    @user = @basket.user
    @order = Order.new
    @address = Address.new
  end

  def create
    @basket = find_or_create_basket
    @order = Order.new(order_params)
    @order.user = current_user
    @order.address = current_user.addresses.first
    if @order.save
      @basket.basket_items.each do |item|
        order_item = OrderItem.new(
                      product_variant: item.product_variant,
                      quantity: item.quantity,
                      order: @order
                    )
        order_item.order = @order
        order_item.save
      end
      @basket.empty!
      redirect_to order_path(@order)
    else
      raise
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
