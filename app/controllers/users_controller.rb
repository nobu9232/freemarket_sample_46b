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
        current_user.cards.create(card_id: params[:token],user_id: current_user.id) if current_user.cards ==[]
        current_user.cards.update(card_id: params[:token],user_id: current_user.id) unless current_user.cards ==[]
      }
    end
  end

  def pay
    Payjp.api_key = "sk_test_47f2b808edb7bc79cf692300"
    charge = Payjp::Charge.create(
      amount: 1000,
      token: current_user.cards.card_id,
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
