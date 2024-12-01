class Young::NorituPostsController < ApplicationController
  before_action :authenticate_young_user!
  before_action :is_not_guest_young_user
  layout 'noritunoraretu'

  def index
    @noritu_posts = NorituPost.all
  end

  def show
    @noritu_post = NorituPost.find(params[:id])
    noritu_favorite = NorituFavorite.find_by(young_user_id: current_young_user.id, noritu_post_id: @noritu_post.id)
    unless noritu_favorite == nil
      @room= noritu_favorite.room
    end 
    render 'senior/noritu_posts/show'

  end


end
