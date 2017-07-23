class PairingsController < ApplicationController
  def create
    @pairing = Pairing.new(pairing_params)
    @pairing.pupil_id = current_user.id
    @pairing.tutor_id = params[:user_id]
    @pairing.save

    flash[:success] = 'Pairing booked successfully'
    redirect_to user_path(@pairing.tutor)
  end

  private
  def pairing_params
    params.require(:pairing).permit(:topic_id, :tutor_date_id)
  end
end
