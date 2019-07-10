class ProductsController < ApplicationController

  def index
  end

  def show
  end

  def new
    render layout: "simple_layout"
    @product = Product.new
  end

  def create
    @brand = Brand.find_by(brand_name: brand_params[:brand_name])
    if @brand == nil
      @brand = Brand.create(brand_params)
    end
    @product_params = product_params.merge(brand_id: @brand[:id])
    @product = Product.create(@product_params)
    @image = Image.new(image_params)
    @image.product_id = @product[:id]
    @image.save
    render :index
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
      :category_grondchild_id, 
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
