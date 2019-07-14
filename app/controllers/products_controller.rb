class ProductsController < ApplicationController

  def index
    @products = Product.order(id: "DESC").includes(:images)
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

  def show
    set_product
    set_image
  end

  def show_sell
    set_product
    set_image
  end

  def confirmation
    set_product
    set_image
    render :confirmation, layout: "simple_layout"
  end

  def buy
    set_product
    set_image
    render :buy, layout: "simple_layout"
  end

  def pay
    @product = Product.find(params[:id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    charge = Payjp::Charge.create(
      amount: @product.sales_price,
      customer: current_user.cards.first.customer_id,
      currency: 'jpy',
    )
    redirect_to buy_product_path(@product.id)
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

  def set_product
    @product = Product.find(params[:id])
  end

  def set_image
    @product = Product.find(params[:id])
    @image = @product.images.first
  end

end
