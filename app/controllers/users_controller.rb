class UsersController < ApplicationController

  def registration
    render :registration, layout:
    "user_application"
  end

  def signup
    render :signup, layout:
    "user_application"
  end



  def update
  end

  

  def show
  end

  def sign_out  
  end

end
