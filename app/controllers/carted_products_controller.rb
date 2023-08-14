class CartedProductsController < ApplicationController

  def index
    @carted_products = current_user.carted_products
    render :index
  end

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: nil,
      status: "carted"
    )
    @carted_product.save
  end

end