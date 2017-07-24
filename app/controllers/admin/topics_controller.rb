class Admin::TopicsController < Admin::BaseController
  before_action :find_topic, only: [:edit, :update, :destroy]
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save
    flash[:success] = "#{@topic.name} created successfully!"
    redirect_to admin_topics_path
  end

  def edit
    
  end

  def update
    if @topic.update(topic_params)
      flash[:success] = "#{@topic.name} updated successfully!"
      redirect_to admin_topics_path
    else
      flash[:danger] = 'Invalid Topic Name'
      render :edit
    end
  end

  def destroy
    @topic.destroy

    flash[:success] = "#{@topic.name} deleted successfully!"
    redirect_to admin_topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end
end
