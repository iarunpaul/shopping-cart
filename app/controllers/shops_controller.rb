class ShopsController < ApplicationController
  def index
    if params[:query]
      @products = Product.search_published(params[:query]).page params[:page]
    else
      @products = Product.order(:released_at).page params[:page]
    end
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
  end


end
