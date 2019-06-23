class UsersController < ApplicationController

  def registration
    render :registration, layout:
    "user_application"
  end
<<<<<<< HEAD
  
  def login
    render :login, layout:
=======

  def signup
    render :signup, layout:
>>>>>>> master
    "user_application"
  end
  
  def show
    # render layout: false
  end
  
  def update
  end

  def card
  end
  

  def sign_out  
  end

  def identification
  end

end
