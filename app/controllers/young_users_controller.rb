class YoungUsersController < ApplicationController
  
  def show
    @young_user= YoungUser.find(params[:id])
    @wisdom_posts= @young_user.wisdom_posts
  end

  def edit
  end
  
  def index
  end
end
