class Young::EventNoticesController < ApplicationController
  before_action :authenticate_young_user!

  def new
    @group = Group.find(params[:group_id])
  end

  def create
    group= Group.find(params[:group_id])
    @title= params[:title]
    @body= params[:body]

    event = {
      :group => group,
      :title => @title,
      :body => @body
    }
    EventMailer.send_notifications_to_group(event, current_young_user)
    render :sent
  end



end