class UsersController < ApplicationController
  before_action :require_pupil_to_tutor, only: [:show, :edit]
  before_action :require_current_user, only: [:show, :edit]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      redirect_to @user
    end
  end

  def show
    @user = User.find(params[:id])
    @pairing = Pairing.new
  end

  def edit
    @user = User.find(params[:id])
    @tutor_date = TutorDate.new
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio, :username, :password, topic_ids: [])
  end
end
