class UsersController < ApplicationController

  def update
  end
  
  def login
    render :login, layout:
    "user_application"
  end
  
  def show
  end
  

  def sign_out  
  end

end
