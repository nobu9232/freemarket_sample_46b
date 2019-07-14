class UsersController < ApplicationController



  #view

  def signup
    render :signup, layout: "simple_layout"
  end
  
  def show
  end

  def card_form
    @user= User.new
  end

  def card_create
    respond_to do |format|
      format.json {
        require 'payjp'
        Payjp.api_key = ENV['PAYJP_SECRET_KEY']
        # 今回は１ユーザー１カード情報のみとする
        if current_user.cards ==[]
          response_customer = Payjp::Customer.create(card: payjp_params[:token])
          current_user.cards.create(customer_id: response_customer.id,user_id: current_user.id) 
        end
      }
    end
  end

  def profile
  end

  def card
  end
  
  def sign_out  
  end

  def identification
  end

  private 
  def payjp_params
    params.permit(:token)
  end

end
