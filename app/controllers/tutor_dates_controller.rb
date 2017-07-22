class TutorDatesController < ApplicationController
  def create
    require "pry"; binding.pry
    @tutor_date = TutorDate.new(date_params)
    @tutor_date.user = User.find(params[:user_id])
    @tutor_date.save

    redirect_to edit_user_path(@tutor_date.user)
  end

  private
  def date_params

  end
end
