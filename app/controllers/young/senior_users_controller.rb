class Young::SeniorUsersController < ApplicationController
  before_action :is_not_guest_young_user
  before_action :authenticate_young_user!
  layout "noritunoraretu"
  
  def show
    @senior_user = SeniorUser.find(params[:id])
  end 
end
