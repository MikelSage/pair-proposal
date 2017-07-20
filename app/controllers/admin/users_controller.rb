class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    @roles = User.roles.keys
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:success] = "#{@user.name} sucessfully destroyed"
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end
end
