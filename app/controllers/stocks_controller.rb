class StocksController < ApplicationController
  
  def search
    if params[:stock].present?
      # store the looked up stock (from user) in @stock
      @stock = Stock.new_from_lookup(params[:stock])
      # if stock symbol was correct, render this
      if @stock
        render 'users/my_portfolio'
      # if @stock is nil (happens if user mistypes a symbol)   
      else
        flash[:danger] = "You have entered an incorrect stock ticker"
        redirect_to my_portfolio_path
      end
      # if user doesnt enter anything
    else
      flash[:danger] = "You did not enter anything... "
      redirect_to my_portfolio_path
    end
  end
  
end