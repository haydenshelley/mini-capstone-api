class ProductsController < ApplicationController

  def index
    @products = Product.all 
    render :index
  end

  def show 
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  def create 
    @product = Product.new(
      name: params['input_name'], 
      price: params['input_price'], 
      image_url: params['input_image_url'], 
      description: params['input_description'])
    @product.save
    render template: "products/show"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.save
    render :show
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Product deleted"}
  end

end