class Order < ApplicationRecord
  has_many :order_items

  def grand_total
    self[:grand_total] = order_items.inject(0) { |sum, order_item| sum + order_item.total }
  end
end
