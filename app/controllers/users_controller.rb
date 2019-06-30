class UsersController < ApplicationController



  #view

  def registration
    render :registration, layout: "user_application"
  end

  def signup
    render :signup, layout: "simple_layout"
  end

  def login
    render :login, layout: "simple_layout"
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
