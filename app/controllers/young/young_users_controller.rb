class Young::YoungUsersController < ApplicationController
  before_action :is_matching_login_young_user, only: [:edit, :update, :destroy]
  before_action :ensure_guest_young_user, only: [:edit, :update]
  before_action :authenticate_young_user!

  def show
    @young_user= YoungUser.find(params[:id])
    @wisdom_posts= @young_user.wisdom_posts
    @wisdom_post_new= WisdomPost.new
  end

  def edit
    @young_user= YoungUser.find(params[:id])
  end

  def destroy
    @young_user= YoungUser.find(params[:id])
    @young_user.destroy
    redirect_to root_path, notice: '退会に成功しました'
  end

  def update
    @young_user= YoungUser.find(params[:id])
    if @young_user.update(young_user_params)
      redirect_to young_user_path(@young_user.id)
    else
      render :edit
    end
  end

  def index
    @young_user= current_young_user
    @young_users= YoungUser.all.page(params[:page]).per(6)
    @wisdom_post_new= WisdomPost.new
  end



  private

  def young_user_params
    params.require(:young_user).permit(:name, :introduction, :profile_image)
  end

  def is_matching_login_young_user
    young_user =YoungUser.find(params[:id])
    unless young_user.id == current_young_user.id
      redirect_to wisdom_posts_path
    end
  end

  def ensure_guest_young_user
    @young_user = YoungUser.find(params[:id])
    if @young_user.email == "guest@example.com"
      redirect_to young_user_path(current_young_user), notice: "ゲストユーザーはプロフィール編集画面へ移行できません"
    end
  end
end
