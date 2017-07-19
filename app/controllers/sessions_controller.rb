class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'Login Successful!'

      redirect_to user
    else
      flash[:error] = 'Incorrect Username or Password'
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = 'Logout Successful!'

    redirect_to root_path
  end
end
