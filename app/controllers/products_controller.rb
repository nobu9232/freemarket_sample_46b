class ProductsController < ApplicationController

  def index
    @products = Product.order(id: "DESC").includes(:product_images)
  end

  def show
  end

  def sell
    render :sell, layout: "simple_layout"
    # sell.html.haml呼び出しの時はlayout/simple_layout.html.hamlを使う
  end

  def confirmation  
    render :confirmation, layout: "simple_layout"
  end


end
