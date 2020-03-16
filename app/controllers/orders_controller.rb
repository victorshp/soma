class OrdersController < ApplicationController

  def create
    @order = Order.new(order_params)
    @order.user =current_user
    @order.save
  end

  private

  def order_params
    params.require(:order).permit(:state, :amount_cents)
  end

end
