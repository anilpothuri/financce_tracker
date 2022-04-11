class UsersController < ApplicationController
 def my_portfolio
  @tracked_stocks = current_user.stocks
 end
 def friends
   @f = current_user.friends
 end
end
