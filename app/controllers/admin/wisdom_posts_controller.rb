class Admin::WisdomPostsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    @wisdom_post= WisdomPost.find(params[:id])
    @wisdom_post.destroy
    redirect_to admin_dashboards_path, notice: '投稿を消去しました'
  end
  
end
