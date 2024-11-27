class Senior::NorituPostsController < ApplicationController
  before_action :authenticate_senior_user!
  before_action :is_noritu_post_author, only: [:edit, :update, :destroy, :show]

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
    @noritu_favorite_young_users = @noritu_post.young_users
   

  end



  def edit
    @noritu_post = NorituPost.find(params[:id])
  end

  def update
    @noritu_post= NorituPost.find(params[:id])
    if  @noritu_post.update(noritu_post_params)
      redirect_to senior_senior_user_path(current_senior_user)
    else
      render :edit
    end
  end

  def destroy
    @noritu_post= NorituPost.find(params[:id])
    @noritu_post.destroy
    redirect_to senior_senior_user_path(current_senior_user)
  end




  private

  def noritu_post_params
    params.require(:noritu_post).permit(:datetime, :current_location, :destination, :title, :body)
  end

  def is_noritu_post_author
    noritu_post = NorituPost.find(params[:id])
    unless noritu_post.senior_user == current_senior_user
      redirect_to senior_senior_user_path(current_senior_user)
    end
  end



end
