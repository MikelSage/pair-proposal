class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_admin, :not_current_user, :require_pupil_to_tutor

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    current_user && current_user.admin?
  end

  def not_current_user
    current_user.id != params[:id].to_i
  end

  def pupil_to_pupil
    user = User.find(params[:id])
    current_user.pupil? && user.pupil?
  end

  def tutor_to_pupil
    user = User.find(params[:id])
    current_user.tutor? && user.pupil?
  end

  def require_pupil_to_tutor
    if not_current_user && (pupil_to_pupil || tutor_to_pupil)
      render file: 'public/404'
    end
  end
end
