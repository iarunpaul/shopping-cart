class OrderItemsController < ApplicationController
  def create
    @order_item = current_order.order_items.new(order_item_params)
    if @order_item.save
      session[:order_id] = @order_item.order.id
    else
      flash[:error] = "Something went wrong"
      render 'shops/index'
    end
  end

  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end
