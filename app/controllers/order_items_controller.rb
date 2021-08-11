class OrderItemsController < ApplicationController
  def create
    @order_items = current_order.order_items
    @order_item = @order_items.new(order_item_params)
    if @order_item.save
      session[:order_id] = @order_item.order.id
    else
      flash[:error] = "Something went wrong"
      render 'shops/index'
    end
  end

  def update
    # byebug
    @order_items = current_order.order_items
    @order_item = @order_items.find(params[:id])
    @order_item.update(quantity: params[:order_item][:quantity])
    @order_items = current_order.order_items
  end

  def destroy
    @order_items = current_order.order_items
    @order_item = @order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
  end



  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end
