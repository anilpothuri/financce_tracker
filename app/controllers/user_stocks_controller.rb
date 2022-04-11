class UserStocksController < ApplicationController
  def create
    stock=Stock.check_db(params[:ticker])
  end
#  def destroy
#user_stock = User.Stock.where(user_id: current_user.id, stock_id: stock.id).first
#user_stock.destroy
#flash[:notice] = "#{stock.ticker }was succefully removed from your poprtfolio"
#redirect_to my_portfolio_path
#  end
end
