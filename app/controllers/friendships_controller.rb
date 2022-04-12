class FriendshipsController < ApplicationController
 def create
   friend = User.find(params[:friend])
   current_user.friendships.build(friend_id: friend.id)
   if current_user.save
     flash[:notice] = "following user"
   else
     flash[:alert] = "there is something wrong"
   end
   redirect_to friends_path
 end
 def destroy

   friendship = current_user.friendships.where(friend_id: params[:id]).first
   friendship.destroy
   flash[:notice] = "succefully removed"
   redirect_to friends_path
 end
end
