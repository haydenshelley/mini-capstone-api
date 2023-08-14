class CartedProductsController < ApplicationController

  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
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
    render :show
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.status = "removed"
    @carted_product.save
    render json: {message: "Product removed"}
  end

end