class Young::WisdomPostsController < ApplicationController
  before_action :is_wisdom_post_author, only: [:edit, :update, :destroy]
  before_action :authenticate_young_user!


    def new
      @wisdom_post_new= WisdomPost.new
    end 
  
  def create
    @wisdom_post_new= WisdomPost.new(wisdom_post_params)
    @wisdom_post_new.young_user_id= current_young_user.id
    if @wisdom_post_new.save
      redirect_to wisdom_posts_path
    else
      render :new
    end

  end

  def index
    @young_user= current_young_user
    @wisdom_posts= WisdomPost.all
    @wisdom_post_new= WisdomPost.new

  end


  def show
    @wisdom_post= WisdomPost.find(params[:id])
    @young_user= @wisdom_post.young_user
    @comment= WisdomPostComment.new
    
  end

  def edit
    @wisdom_post = WisdomPost.find(params[:id])
  end

  def update
    @wisdom_post= WisdomPost.find(params[:id])
    if @wisdom_post.update(wisdom_post_params)
      redirect_to wisdom_post_path(@wisdom_post.id)
    else
      render :edit
    end
  end

  def destroy
    wisdom_post= WisdomPost.find(params[:id])
    wisdom_post.destroy
    redirect_to wisdom_posts_path
  end




  private
  
  def is_wisdom_post_author
    wisdom_post= WisdomPost.find(params[:id])
    unless wisdom_post.young_user.id == current_young_user.id
      redirect_to wisdom_posts_path
    end 
  end 
  


  def wisdom_post_params
    params.require(:wisdom_post).permit(:title, :body, :caption, :wisdom_post_image)
  end
end