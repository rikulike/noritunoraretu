class Senior::NorituPostsController < ApplicationController
  layout 'senior'
  before_action :authenticate_senior_user!

  def new
    @noritu_post= NorituPost.new
  end

  def create
    @noritu_post= NorituPost.new(noritu_post_params)
    @noritu_post.senior_user_id = current_senior_user.id
    @noritu_post.save
    redirect_to senior_senior_user_path(current_senior_user)
  end

  def show

    
  end

  def index
  
  end

  def edit

  end

  private

  def noritu_post_params
    params.require(:noritu_post).permit(:datetime, :current_location, :destination)
  end
end
