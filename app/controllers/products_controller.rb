class ProductsController < ApplicationController
  before_action :set_product ,only: [:update, :edit, :show, :show_sell, :confirmation, :buy, :pay]
  before_action :set_image ,only: [:update, :edit, :show, :show_sell, :confirmation, :buy]

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
      redirect_to root_path
    else
      render action: :new, layout: "simple_layout"
    end
  end

  def edit
    render layout: "simple_layout"
  end

  def update
    # binding.pry
    @brand = Brand.find_by(brand_name: brand_params[:brand_name])
    if !@brand
      Brand.transaction do
        @brand = Brand.create(brand_params)
      end
    end
    
    @edit_params = edit_params.merge(brand_id: @brand[:id])
    if @product.update(@edit_params)
      redirect_to show_sell_path(@product)
    else
      render :edit
    end
  end

  def show
  end

  def show_sell
    redirect_to root_path unless user_signed_in? && current_user.id == @product.seller_user_id
  end

  def confirmation    
    render :confirmation, layout: "simple_layout"
  end

  def buy
    render :buy, layout: "simple_layout"
  end

  def pay
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      charge = Payjp::Charge.create(
        amount: @product.sales_price,
        customer: current_user.cards.first.customer_id,
        currency: 'jpy',
      )
      @product.update(buyer_user_id: current_user.id, status: 2)
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

  def edit_params
    params.require(:product).permit(
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
    )
  end

  def image_params
    params.permit(:image, :image_cache)
  end

  def brand_params
    params.permit(:brand_name)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_image
    @image = Product.find(params[:id]).images.first
  end


end
