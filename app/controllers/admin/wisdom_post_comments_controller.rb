class Admin::WisdomPostCommentsController < ApplicationController
  before_action :authenticate_admin!
  

  def destroy
    @wisdom_post_comment= WisdomPostComment.find(params[:id])
    @wisdom_post_comment.destroy
    redirect_to admin_dashboards_path, notice: 'コメントを消去しました'
  end 
  
end
