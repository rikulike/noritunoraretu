class Young::NorituPostsController < ApplicationController
  before_action :authenticate_young_user!
  before_action :is_not_guest_young_user
  
  def index
    @noritu_posts = NorituPost.all
  end 
  
  def show 
    @noritu_post = NorituPost.find(params[:id])
    render 'senior/noritu_posts/show'
  end 
  

end
