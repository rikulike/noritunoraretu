class Senior::NorituFavoritesController < ApplicationController
  before_action :authenticate_young_user!
  before_action :is_not_guest_young_user
  layout 'noritunoraretu'

  def create
    noritu_post = NorituPost.find(params[:noritu_post_id])
    noritu_favorite = current_young_user.noritu_favorites.new(noritu_post_id: noritu_post.id)
    noritu_favorite.save

    room= Room.new(young_user_id: current_young_user.id, senior_user_id: noritu_post.senior_user.id, noritu_favorite_id: noritu_favorite.id)
    room.save

    redirect_to young_noritu_post_path(noritu_post)
  end

  def destroy
    noritu_post = NorituPost.find(params[:noritu_post_id])
    noritu_favorite = current_young_user.noritu_favorites.find_by(noritu_post_id: noritu_post.id)
    noritu_favorite.destroy

    room = Room.find_by(young_user_id: current_young_user.id, senior_user_id: noritu_post.senior_user.id, noritu_favorite_id: noritu_favorite.id)
    room.destroy

    redirect_to young_noritu_post_path(noritu_post)
  end

  def index
    @noritu_favorites = NorituFavorite.where(young_user_id: current_young_user.id)
  end

end
