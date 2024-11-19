class Young::HomesController < ApplicationController
  before_action :authenticate_young_user!
  def about
  end 
end
