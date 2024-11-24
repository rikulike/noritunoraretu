class Senior::NorituFavoritesController < ApplicationController
  
  def create
    noritu_post = NorituPost.find(params[:noritu_post_id])
    noritu_favorite = current_young_user.noritu_favorites.new(noritu_post_id: noritu_post.id)
    noritu_favorite.save
    redirect_to senior_noritu_post_path(noritu_post)
  end 
  
  def destroy
    noritu_post = NorituPost.find(params[:noritu_post_id])
    noritu_favorite = current_young_user.noritu_favorites.find_by(noritu_post_id: noritu_post.id)
    noritu_favorite.destroy
    redirect_to senior_noritu_post_path(noritu_post)
  end 
end
