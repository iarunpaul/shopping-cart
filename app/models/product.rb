require 'elasticsearch/model'

class Product < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  has_many :order_items
  belongs_to :category
  paginates_per 10
  scope :unreleased, -> { where("released_at > ?", Date.today) }

  def self.search_with_elasticsearch(*args)
    __elasticsearch__.search(*args)
  end

end
