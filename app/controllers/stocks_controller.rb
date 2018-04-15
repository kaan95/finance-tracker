class StocksController < ApplicationController
  
  def search
    # if user doesnt enter anything
    if params[:stock].blank?
      flash.now[:danger] = "You did not enter anything... "
    else
      # if stock is present, store in @stock
      @stock = Stock.new_from_lookup(params[:stock])
      # give error message if stock is null unless stock is valid, then proceed to the render part
      flash.now[:danger] = "You have entered an incorrect stock ticker" unless @stock
    end
    render partial: 'users/result'
  end
  
end