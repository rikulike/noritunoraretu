class Young::GroupsController < ApplicationController
  before_action :is_matching_login_young_user, only:[:edit, :update]
  def new
    @group= Group.new
  end

  def create
    @group= Group.new(group_params)
    @group.owner_id= current_young_user.id
    @group.save
    redirect_to young_groups_path
  end




  def index
    @groups= Group.all
  end

  def show
    @group= Group.find(params[:id])
  end

  def edit
    @group= Group.find(params[:id])

  end

  def update
    @group= Group.find(params[:id])
    @group.update(group_params)
    redirect_to young_groups_path
  end

  def destroy
    group= Group.find(params[:id])
    group.destroy
    redirect_to young_groups_path
  end 



  private

  def group_params
    params.require(:group).permit(:name, :introduction, :group_image)
  end
  
  def is_matching_login_young_user
    group= Group.find(params[:id])
    unless group.owner_id == current_young_user.id
      redirect_to young_groups_path
    end 
  end 
    
end



