class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    if young_user_signed_in?
      @message.user_id = current_young_user.id
      @message.is_young = true
    else
      @message.user_id = current_senior_user.id
      @message.is_young = false
    end
    if @message.save
      redirect_to room_path(@message.room)
    else
      @room= @message.room
      @messages= @room.messages.all
      @young_user= @room.young_user
      @senior_user= @room.senior_user
      render 'rooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:message, :room_id)
  end
end
