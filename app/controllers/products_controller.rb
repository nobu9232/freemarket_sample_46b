class ProductsController < ApplicationController
  before_action :set_product ,only: [:show, :show_sell, :confirmation, :buy, :pay]
  before_action :set_image ,only: [:show, :show_sell, :confirmation, :buy]

  def index
    @products = Product.order(id: "DESC").includes(:images)

  end

  def new
    if user_signed_in?
      render layout: "simple_layout"
      @product = Product.new 
    else
      redirect_to new_user_session_path
    end
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

  def show_sell
    redirect_to root_path unless user_signed_in? && current_user.id == @product.seller_user_id
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy  
    redirect_to root_path
  end

  def show

  end

  def confirmation
    if user_signed_in? && current_user.id == @product.seller_user_id
      redirect_to new_user_session_path
    elsif user_signed_in? 
      render :confirmation, layout: "simple_layout"  

    else
      redirect_to new_user_session_path
    end
  end

  def buy
    render :buy, layout: "simple_layout"
  end

  def pay
    if current_user.cards == []
      redirect_to card_form_user_path(current_user)
    else
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      charge = Payjp::Charge.create(
        amount: @product.sales_price,
        customer: current_user.cards.first.customer_id,
        currency: 'jpy',
      )
      @product.update(buyer_user_id: current_user.id, status: 2)
      redirect_to buy_product_path(@product.id)
    end
  end

  def search
    @keyword = params[:keyword]
    @products = Product.where('name LIKE(?)', "%#{@keyword}%")
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
    @image = Product.find(params[:id]).images.first
  end


end
