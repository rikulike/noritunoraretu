class Young::WisdomPostsController < ApplicationController


  def create
    @wisdom_post= WisdomPost.new(wisdom_post_params)
    @wisdom_post.young_user_id= current_young_user.id
    @wisdom_post.save
    redirect_to wisdom_posts_path
  end

  def index
    @young_user= current_young_user
    @wisdom_posts= WisdomPost.all
    @wisdom_post_new= WisdomPost.new
  end

  def show
    @wisdom_post= WisdomPost.find(params[:id])
    @young_user= @wisdom_post.young_user
    @wisdom_post_new= WisdomPost.new
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