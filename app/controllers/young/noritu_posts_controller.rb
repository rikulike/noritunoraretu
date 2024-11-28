class Young::NorituPostsController < ApplicationController
  before_action :authenticate_young_user!
  before_action :is_not_guest_young_user
  
  def index
    @noritu_posts = NorituPost.all
  end 
  
  def show 
    @noritu_post = NorituPost.find(params[:id])
    @room= Room.find_by(senior_user_id: @noritu_post.senior_user.id, young_user_id: current_young_user.id, noritu_post_id: @noritu_post.id)
    render 'senior/noritu_posts/show'
    
  end 
  

end
