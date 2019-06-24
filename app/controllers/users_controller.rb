class UsersController < ApplicationController

  def registration
    render :registration, layout:
    "user_application"
  end

  def signup
    render :signup, layout:
    "user_application"
  end
  
  def show
    # render layout: false
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
