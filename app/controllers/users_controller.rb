class UsersController < ApplicationController



  #view

  def registration
    render :registration, layout: "user_application"
  end

  def signup
    render :signup, layout:
    "simple_layout"
  end

  def login
    render :login, layout:
    "simple_layout"
  end

  def show
    # render layout: false
  end
  
  def update
  end

  def card
  end
  

  def signout  
  end

  def identification
  end
  
end
