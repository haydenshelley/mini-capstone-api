class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all 
    render :index
  end

  def create
    @supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    if @supplier.save
      render :show
    else
      render json: {error: @product.errors.full_messages, status: 422}
    end
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    render :show
  end

  def update
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.name = params[:name] || @supplier.name
    @supplier.email = params[:email] || @supplier.email
    @supplier.phone_number = params[:phone_number] || @supplier.phone_number
    if @supplier.save
      render :show
    else
      render json: {error: @product.errors.full_messages, status: 422}
    end
  end

  def destroy
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.destroy
    render json: {message: "Succesfully deleted"}
  end

end