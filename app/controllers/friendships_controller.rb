class FriendshipsController < ApplicationController
  def destroy
    # where clause returns relation but we want to grab the first one
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @friendship.destroy
    flash[:notice] = "Friend was successfully removed"
    redirect_to my_friends_path
  end
end