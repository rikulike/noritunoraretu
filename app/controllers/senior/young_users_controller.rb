class Senior::YoungUsersController < ApplicationController
  def show
    @young_user = YoungUser.find(params[:id])
    @room = Room.find_by(senior_user_id: current_senior_user.id, young_user_id: @young_user.id)
  end
end
