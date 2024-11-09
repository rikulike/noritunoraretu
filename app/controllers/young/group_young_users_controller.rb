class Young::GroupYoungUsersController < ApplicationController
  
  def create
    group_young_user = current_young_user.group_young_users.new(group_id: params[:group_id])
    group_young_user.save
    redirect_to request.referer
  end 
  
  def destroy
    group_young_user = current_young_user.group_young_users.find_by(group_id: params[:group_id])
    group_young_user.destroy
    redirect_to request.referer
  end 
  
  private
  
end
