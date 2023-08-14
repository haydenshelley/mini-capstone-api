class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render :index
  end

  def create
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    
    calculated_subtotal = 0
    @carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price * carted_product.quantity  
    end

    calculated_tax = 0
    @carted_products.each do |carted_product|
      calculated_tax += carted_product.product.tax * carted_product.quantity 
    end

    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    if @order.save
      @carted_products.each do |carted_product|
        carted_product.status = "purchased"
        carted_product.order_id = @order.id
        carted_product.save
      end
      render :show
    else
      render json: {error: @product.errors.full_messages, status: 422}
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    if @order.user_id == current_user.id
      render :show
    else
      render json: {}, status: :unauthorized
    end
  end

end