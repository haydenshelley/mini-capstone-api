class Product < ApplicationRecord
  has_many :images
  belongs_to :supplier
  # has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :users, through: :carted_products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { minimum: 10 }
  validates :description, length: { maximum: 500 }
  validates :inventory, numericality: { greater_than_or_equal_to: 0 }

  def is_discounted?
    price <= 10
  end

  def tax
    @tax_rate = 0.09
    @tax = price * @tax_rate
    return @tax
  end

  def total
    @total = tax + price
    return @total
  end

end