class UsersController < ApplicationController
  
  def my_portfolio
    @user = current_user
    @user_stocks = current_user.stocks
  end
  
  def my_friends
    # save the users friends in the instance variable
    @friendships = current_user.friends
  end
  
  def search
    if params[:search_param].blank?
      flash.now[:danger] = "You did not enter anything... "
    else
      # if user is present, store in @user
      @users = User.search(params[:search_param])
      # 
      @users = current_user.except_current_users(@users)
      # give error message if user is null unless user is valid, then proceed to the render part
      flash.now[:danger] = "No users matched your search" if @users.blank?
    end
    render partial: 'friends/result'
  end
  
  def add_friend
    # get the friend id from param 'link'-> (hover over button)
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)
    
    if current_user.save
      flash[:success] = "Friend was successfully added"
    else
      flash[:danger] = "Something went wrong with the friend request"
    end
    redirect_to my_friends_path
  end
  
  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks
  end
end

