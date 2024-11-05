class Young::WisdomPostCommentsController < ApplicationController

  def create
    wisdom_post= WisdomPost.find(params[:wisdom_post_id])
    comment= current_young_user.wisdom_post_comments.new(wisdom_post_comment_params)
    comment.wisdom_post_id= wisdom_post.id
    comment.save
    redirect_to wisdom_post_path(wisdom_post)
  end

  private

  def wisdom_post_comment_params
    params.require(:wisdom_post_comment).permit(:comment)
  end
end

