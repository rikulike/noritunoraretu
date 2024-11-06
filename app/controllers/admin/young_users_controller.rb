class Admin::YoungUsersController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'
  
  def show
    @young_user= YoungUser.find(params[:id])
    @wisdom_posts= @young_user.wisdom_posts
    @wisdom_post_comments= @young_user.wisdom_post_comments
  end 
  
  def destroy
    @young_user= YoungUser.find(params[:id])
    @young_user.destroy
    redirect_to admin_dashboards_path, notice:'ユーザーを消去しました'
  end
end
