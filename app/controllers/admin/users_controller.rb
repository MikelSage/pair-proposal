class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: [:edit, :update, :show, :destroy]
  def index
    @users = User.all
  end

  def edit
    @roles = User.roles.keys
  end

  def update
    @user.update(user_params)
    redirect_to admin_user_path(@user)
  end

  def show

  end

  def destroy
    @user.destroy

    flash[:success] = "#{@user.name} sucessfully destroyed"
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end
end
