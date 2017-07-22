class TutorDatesController < ApplicationController
  def create
    @tutor_date = TutorDate.new(date_params)
    @tutor_date.user_id = params[:user_id]
    # require "pry"; binding.pry
    @tutor_date.save

    redirect_to edit_user_path(@tutor_date.user)
  end

  private
  def date_params
    params.require(:tutor_date).permit(:date, :duration)
  end
end
