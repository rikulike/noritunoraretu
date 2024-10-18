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
  end

  def show
  end

  def edit
  end





  private

  def wisdom_post_params
    params.require(:wisdom_post).permit(:title, :body, :caption)
  end
end