class Product < ApplicationRecord
  has_many :order_items
  belongs_to :category
  paginates_per 10
  scope :unreleased, -> { where("released_at > ?", Date.today) }
end
