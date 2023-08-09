class OrdersController < ApplicationController

  def index
    @orders = Order.all 
    render :index
  end

  def create
    if current_user
      @order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: params[:subtotal],
        tax: params[:tax],
        total: params[:total]
      )
      @order.save
      render :show
    else
      render json: {message: "User must be logged in to create an order"}
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    render :show
  end

end
