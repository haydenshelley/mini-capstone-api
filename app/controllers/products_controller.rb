class ProductsController < ApplicationController

  def all
    @products = Product.all
    render template: "products/index"
  end

end
