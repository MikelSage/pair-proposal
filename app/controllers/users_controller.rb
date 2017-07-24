class UsersController < ApplicationController
  before_action :require_pupil_to_tutor, only: [:show, :edit]
  before_action :require_current_user, only:  [:edit]
  before_action :find_user, only: [:show, :edit, :update]
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
    @pairing = Pairing.new
  end

  def edit
    @tutor_date = TutorDate.new
  end

  def update
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio, :username, :password, topic_ids: [])
  end
end
