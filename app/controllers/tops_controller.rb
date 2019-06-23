class TopsController < ApplicationController

  def index
  end


  def show
  end

  #sellアクション仮置き
  def sell
    render :sell, layout: "simple_layout"
    # sell.html.haml呼び出しの時はlayout/simple_layout.html.hamlを使う
  end
  
end
