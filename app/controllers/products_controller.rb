class ProductsController < ApplicationController

  def index
    @products = Product.all 
    render template: "products/index"
  end

end