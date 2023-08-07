class ProductsController < ApplicationController

  def index
    @products = Product.all 
    render :index
  end

  def show 
    @product = Product.find_by(id: params[:id])
    render :show
  end

  def create 
    @product = Product.new(
      name: params[:name], 
      price: params[:price], 
      supplier_id: params[:supplier_id],
      description: params[:description],
      inventory: params[:inventory])
    if @product.save
      render :show
    else  
      render json: {error: @product.errors.full_messages, status: 422}
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.supplier = params[:supplier_id] || @product.supplier
    @product.description = params[:description] || @product.description
    @product.inventory = params[:inventory] || @product.inventory
    if @product.save
      render :show
    else  
      render json: {error: @product.errors.full_messages, status: 422}
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Product deleted"}
  end

end