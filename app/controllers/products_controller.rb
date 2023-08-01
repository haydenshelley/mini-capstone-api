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

end