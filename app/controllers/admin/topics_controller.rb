class Admin::TopicsController < Admin::BaseController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    flash[:notice] = "#{@topic.name} created successfully!"
    redirect_to admin_topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end
end
