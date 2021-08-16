class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :set_unit_price, :set_total

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.unit_price
    end
  end

  def total
    unit_price * quantity
  end

  private
  def set_unit_price
    self[:unit_price] = unit_price
  end

  def set_total
    self[:total] = unit_price * quantity
  end

end
