class TutorDatesController < ApplicationController
  def create
    @tutor_date = TutorDate.new(date_params)
    @tutor_date.user_id = params[:user_id]
    @tutor_date.save

    flash[:success] = "#{@tutor_date.formatted_date} created successfully"

    redirect_to edit_user_path(@tutor_date.user)
  end

  private
  def date_params
    params.require(:tutor_date).permit(:date, :duration)
  end
end
