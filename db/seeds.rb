# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  Category.create do |category|
    category.name = Faker::Commerce.department
      5.times do
        category.products.build do |product|
        product.title = Faker::Commerce.product_name
        product.unit_price = Faker::Commerce.price
        product.released_at = Faker::Date.in_date_period
      end
    end
  end
end