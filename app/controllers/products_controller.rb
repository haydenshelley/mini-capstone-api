class ProductsController < ApplicationController

  def all
    @products = Product.all
    render template: "products/index"
  end

  def keys
    @product = Product.find_by(name: "keyboard")
    render template: "products/show"
  end

  def desk
    @product = Product.find_by(name: "desk")
    render template: "products/show"
  end

  def chair
    @product = Product.find_by(name: "chair")
    render template: "products/show"
  end

end
