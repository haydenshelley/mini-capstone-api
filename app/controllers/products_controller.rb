class ProductsController < ApplicationController

  def index
    @products = Product.all 
    render template: "products/index"
  end

  def show 
    p params[:id]
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  def create 
    @product = Product.new(name: "headphones", price: 200, image_url: "https://www.beatsbydre.com/content/dam/beats/web/product/headphones/studiopro-wireless/pdp/product-carousel/black/pc-studiopro-black-thrqtr-right.jpg", description: "headphones with good sound")
    @product.save
    render template: "products/show"
  end

end