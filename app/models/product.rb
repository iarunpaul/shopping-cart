require 'elasticsearch/model'

class Product < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  has_many :order_items
  belongs_to :category
  paginates_per 5
  scope :unreleased, -> { where("released_at > ?", Date.today) }

  settings index: { number_of_shards: 1 }
  settings do
    mappings dynamic: false do
      indexes :title, type: :text, analyzer: :english
      indexes :unit_price, type: :double
      indexes :released_at, type: :date
    end
  end

  def released_date
    released_at.strftime("%d-%m-%Y")
  end

  # [FIX] resolution of conflict with ransack#search
  # [FIX] as per https://github.com/elastic/elasticsearch-rails/issues/96
  def self.search_with_elasticsearch(*args)
    __elasticsearch__.search(*args)
  end

  # elasticsearch with released filter
  def self.search_published(query)
    __elasticsearch__.search({
      query: {
        bool: {
          must: {
            match: {
              title: query
            }
          },
          # [
          # {
          #   multi_match: {
          #     query: query,
          #     fields: [:title]
          #   }
          # },
        # ]
           filter: {
            range: {
              released_at: { lte: Date.today }
            }
          }
        }
      }
    })
  end

end
