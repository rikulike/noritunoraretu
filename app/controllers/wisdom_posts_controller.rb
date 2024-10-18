class WisdomPostsController < ApplicationController
  def new
    @wisdom_post= WisdomPost.new
  end

  def create
    @wisdom_post= WisdomPost.new(wisdom_post_params)
    @wisdom_post.young_user_id= current_young_user.id
    @wisdom_post.save
    redirect_to wisdom_posts_path
  end

  def index
    @wisdom_posts= WisdomPost.all
  end

  def show
    @wisdom_post = WisdomPost.find(params[:id])
  end

  def edit
    @wisdom_post = WisdomPost.find(params[:id])
  end

  def update
    wisdom_post= WisdomPost.find(params[:id])
    wisdom_post.update(wisdom_post_params)
    redirect_to wisdom_post_path(wisdom_post.id)
  end 
  
  def destroy
    wisdom_post= WisdomPost.find(params[:id])
    wisdom_post.destroy
    redirect_to wisdom_posts_path
  end




  private

  def wisdom_post_params
    params.require(:wisdom_post).permit(:title, :body, :caption)
  end
end