class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all - [ current_user ]
  end

  def show
    @user = User.find(params[:id])
    @message = Message.new

    if current_user == @user
      following_ids = current_user.following
      following_ids << current_user.id
      @messages = Message.where(user_id: following_ids)
    else
      @messages = @user.messages
    end
  end

  def follow
    @user = User.find(params[:id])

    current_user.following << @user.id
    current_user.save

    redirect_to user_url(id: @user.id), notice: "Now following user @#{@user.username}"
  end

  def unfollow
    @user = User.find(params[:id])

    current_user.following.delete(@user.id)
    current_user.save

    redirect_to user_url(id: @user.id), notice: "Unfollowed user @#{@user.username}"
  end

end
