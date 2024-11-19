class Senior::NorituPostsController < ApplicationController
  layout 'senior'
  before_action :authenticate_senior_user!

  def new
    @notiru_post= NorituPost.new
  end

  def create
  end

  def show
  end

  def index
  end

  def edit
  end
end
