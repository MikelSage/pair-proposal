class TutorDatesController < ApplicationController
  def create
    @tutor_date = TutorDate.new(date_params)
    @tutor_date.user_id = params[:user_id]

    if @tutor_date.save
      flash[:success] = "#{@tutor_date.formatted_date} created successfully"
    else
      flash[:danger] = 'Invalid values entered'
    end
    redirect_to edit_user_path(@tutor_date.user)
  end

  def destroy
    @tutor_date = TutorDate.find(params[:id])
    @user = @tutor_date.user
    @tutor_date.destroy

    flash[:success] = 'Date deleted successfully'

    redirect_to edit_user_path(@user)
  end

  private
  def date_params
    params.require(:tutor_date).permit(:date, :duration)
  end
end
