class Senior::SeniorUsersController < ApplicationController
  layout 'senior'
  before_action :authenticate_senior_user!
  before_action :is_matching_login_senior_user, only: [:edit, :update, :destroy, :show]


  def show
    @senior_user = SeniorUser.find(params[:id])
    @noritu_posts = NorituPost.where(senior_user_id: @senior_user.id)

  end

  def edit
    @senior_user = SeniorUser.find(params[:id])
  end

  def update
    @senior_user = SeniorUser.find(params[:id])
      if @senior_user.update(senior_user_params)
        redirect_to senior_senior_user_path(current_senior_user)
      else
        render :edit
      end
  end

  def destroy
    @senior_user = SeniorUser.find(params[:id])
    @senior_user.destroy
    redirect_to root_path
  end



  private

  def senior_user_params
    params.require(:senior_user).permit(:name, :introduction, :profile_image)
  end
end

  def is_matching_login_senior_user
    senior_user =SeniorUser.find(params[:id])
    unless senior_user.id == current_senior_user.id
      redirect_to senior_senior_user_path(current_senior_user)
    end
  end