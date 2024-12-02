class Senior::YoungUsersController < ApplicationController
  before_action :authenticate_senior_user!
  layout 'noritunoraretu'
  def show
    @young_user =YoungUser.find(params[:id])
  end
end
