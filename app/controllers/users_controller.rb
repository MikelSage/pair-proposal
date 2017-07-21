class UsersController < ApplicationController
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
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    if params[:user][:topic_ids].length > 1
      @user.topics.clear
      topics = Topic.find(topic_ids)
      @user.topics << topics
    elsif params[:user][:topic_ids]
      @user.topics.clear
    end

    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio, :username, :password)
  end

  def topic_ids
    params[:user][:topic_ids].delete_if(&:empty?)
  end
end
