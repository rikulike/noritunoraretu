class RoomsController < ApplicationController

  def show
    @room = Room.find(params[:id])
    @messages= @room.messages.all
    @message= Message.new
    @young_user= @room.young_user
    @senior_user= @room.senior_user
  end
end
