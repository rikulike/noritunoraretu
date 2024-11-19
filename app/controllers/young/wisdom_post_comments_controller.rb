class Young::WisdomPostCommentsController < ApplicationController
  before_action :authenticate_young_user!
  def create
    @wisdom_post= WisdomPost.find(params[:wisdom_post_id])
    @comment= current_young_user.wisdom_post_comments.new(wisdom_post_comment_params)
    @comment.wisdom_post_id= @wisdom_post.id
    
    if @comment.save
      redirect_to wisdom_post_path(@wisdom_post)
    else 
      @young_user= @wisdom_post.young_user

      render 'young/wisdom_posts/show'
    end 
  end
  
  def destroy
    WisdomPostComment.find(params[:id]).destroy
    redirect_to wisdom_post_path(params[:wisdom_post_id])
  end 
  private

  def wisdom_post_comment_params
    params.require(:wisdom_post_comment).permit(:comment)
  end
end

