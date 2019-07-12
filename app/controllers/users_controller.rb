class UsersController < ApplicationController



  #view

  def signup
    render :signup, layout: "simple_layout"
  end
  
  def show
    # render layout: false
  end

  def card_form
    @user= User.new
  end

  def card_create
    respond_to do |format|
      format.json {
        require 'payjp'
        Payjp.api_key = "sk_test_47f2b808edb7bc79cf692300"
        # 今回は１ユーザー１カード情報のみとする
        if current_user.cards ==[]
          response_customer = Payjp::Customer.create(card: params[:token])
          current_user.cards.create(customer_id: response_customer.id,user_id: current_user.id) 
        end
      }
    end
  end

  def pay
    @product = Product.find(1)
    Payjp.api_key = "sk_test_47f2b808edb7bc79cf692300"
    charge = Payjp::Charge.create(
      amount: @product.sales_price,
      customer: current_user.cards.first.customer_id,
      currency: 'jpy',
    )
  end

  
  def profile
  end

  def card
  end
  

  def sign_out  
  end

  def identification
  end
  
end
