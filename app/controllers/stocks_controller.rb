class StocksController < ApplicationController
  
  def search
    # store the looked up stock (from user) in @stock
    @stock = Stock.new_from_lookup(params[:stock])
    render 'users/my_portfolio'
  end
  
end