class TutorsController < ApplicationController
  def index
    if params[:tutor]
      @tutors = User.tutors_by_topic(params[:tutor][:topic_id])
      @topic = Topic.find(params[:tutor][:topic_id])
    end
  end
end
