class UsersController < ApplicationController
 def my_portfolio
   @user = current_user
  @tracked_stocks = current_user.stocks
 end
 def friends
   @f = current_user.friends
   @users=User.all
 end

 def show
  @user = User.find(params[:id])
    @tracked_stocks = current_user.stocks
 end

 def search
 #render json: params[:friend]
 if params[:friend].present?
      @friends = User.search(params[:friend])
      if @friends
        respond_to do |format|
          format.js { render partial: 'users/friend_result' }
        end
      else
        #respond_to do |format|
          flash.now[:alert] = "Couldn't find user"
          #format.js { render partial: 'users/friend_result' }
      #  end
      end
  else
      #respond_to do |format|
        flash.now[:alert] = "Please enter a friend name or email to search"
        #format.js { render partial: 'users/friend_result' }
      #end
  end
end
end
