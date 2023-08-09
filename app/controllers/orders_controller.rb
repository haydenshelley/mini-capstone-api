class OrdersController < ApplicationController

  def index
    if current_user
      @orders = current_user.orders
      render :index
    else
      render json: {message: "User must be logged in to see orders"}
    end
  end

  def create
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = product.tax * params[:quantity].to_i
    calculated_total = calculated_subtotal + calculated_tax

    if current_user
      @order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: calculated_subtotal,
        tax: calculated_tax,
        total: calculated_total
      )
      @order.save
      render :show
    else
      render json: {message: "User must be logged in to create an order"}
    end
  end

  def show
    if current_user
      @order = current_user.orders.find_by(id: params[:id])
      render :show
    else
      render json: {message: "User must be logged in to see order"}
    end
  end

end


# if current_user
#   @order = Order.new(
#     user_id: current_user.id,
#     product_id: params[:product_id],
#     quantity: params[:quantity],
#     subtotal: Product.find_by(id: params[:product_id]).price * params[:quantity].to_i,
#     tax: Product.find_by(id: params[:product_id]).tax,
#     total: Product.find_by(id: params[:product_id]).price * params[:quantity].to_i + Product.find_by(id: params[:product_id]).tax
#   )
#   @order.save
#   render :show
# else
#   render json: {message: "User must be logged in to create an order"}
# end