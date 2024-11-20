class Senior::NorituPostsController < ApplicationController
  layout 'senior'
  before_action :authenticate_senior_user!

  def new
    @noritu_post= NorituPost.new
  end

  def create
    @noritu_post= NorituPost.new(noritu_post_params)
    @noritu_post.senior_user_id = current_senior_user.id
    if @noritu_post.save
    redirect_to senior_senior_user_path(current_senior_user)
    else 
    render :new
    end 
  end

  def show
    @noritu_post= NorituPost.find(params[:id])
    
  end

  def index
    @noritu_posts= NorituPost.all
  end

  def edit
  end

  private

  def noritu_post_params
    params.require(:noritu_post).permit(:datetime, :current_location, :destination, :title, :body)
  end
end
