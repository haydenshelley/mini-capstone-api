class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render :index
  end

  def create
    @user_products = current_user.carted_products
    @carted_products = @user_products.where(status == "carted") 
    
    calculated_subtotal = 0
    @carted_products.each do |carted_product|
      temp_sum = Product.find_by(id: carted_product.product_id).price * carted_product.quantity
      calculated_subtotal += temp_sum
    end

    calculated_tax = 0
    @carted_products.each do |carted_product|
      temp_sum = Product.find_by(id: carted_product.product_id).tax * carted_product.quantity
      calculated_tax += temp_sum
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