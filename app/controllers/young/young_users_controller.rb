class Young::YoungUsersController < ApplicationController

  def show
    @young_user= YoungUser.find(params[:id])
    @wisdom_posts= @young_user.wisdom_posts
    @wisdom_post_new= WisdomPost.new
  end

  def edit
    @young_user= YoungUser.find(params[:id])
  end

  def update
    @young_user= YoungUser.find(params[:id])
    @young_user.update(young_user_params)
    redirect_to young_user_path(@young_user.id)
  end

  def index
    @young_user= current_young_user
    @young_users= YoungUser.all
    @wisdom_post_new= WisdomPost.new
  end



  private

  def young_user_params
    params.require(:young_user).permit(:name, :introduction, :profile_image)
  end
  
  
end
