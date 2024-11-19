class Senior::HomesController < ApplicationController
  layout 'senior'
  before_action :authenticate_senior_user!
  def about 
  end 
end
