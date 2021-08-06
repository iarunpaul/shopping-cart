class ApplicationController < ActionController::Base
  helper_method :current_order

  private
  def current_order
    session[:order_id] ? Order.find(session[:order_id]) : Order.new
  end

end
