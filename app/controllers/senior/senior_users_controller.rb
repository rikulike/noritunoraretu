class Senior::SeniorUsersController < ApplicationController
  layout 'senior'
  before_action :authenticate_senior_user!
  
  def show
  end

  def edit
  end
end
