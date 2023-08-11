class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products

  # def products
  #   category_products.each do |cp|
  #     p cp.product
  #   end
  # end

end
