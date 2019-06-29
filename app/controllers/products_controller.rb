class ProductsController < ApplicationController

  def index
  end

  def show
  end

  def sell
    render :sell, layout: "simple_layout"
    @product = Product.new
  end

  def confirmation  
    render :confirmation, layout: "simple_layout"
  end


end
