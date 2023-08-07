class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all 
    render :index
  end

end