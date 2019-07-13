class ProductsController < ApplicationController

  def index
    @products = Product.order(id: "DESC").includes(:images)
  end

  def show
  end

  def new
    render layout: "simple_layout"
    @product = Product.new
  end

  def create
    @brand = Brand.find_by(brand_name: brand_params[:brand_name])
    if !@brand
      Brand.transaction do
        @brand = Brand.create(brand_params)
      end
    end
    @product_params = product_params.merge(brand_id: @brand[:id])
    @product = Product.new(@product_params)
    if @product.save
      @image = Image.new(image_params)
      @image.product_id = @product[:id]
      @image.save
      render :index
    else
      render action: :new, layout: "simple_layout"
    end
  end
    
  def show_sell
    
  end


  def confirmation  
    render :confirmation, layout: "simple_layout"
  end

  private 
  def product_params
    params.permit(
      :name, 
      :text, 
      :category_id, 
      :category_child_id, 
      :category_groundchild_id, 
      :size_id, 
      :condition, 
      :shipping_charge, 
      :shipping_method_id, 
      :prefecture_id, 
      :shipping_days, 
      :sales_price
    ).merge(status: 0, seller_user_id: current_user.id)
  end
  
  def image_params
    params.permit(:image)
  end

  def brand_params
    params.permit(:brand_name)
  end

end
