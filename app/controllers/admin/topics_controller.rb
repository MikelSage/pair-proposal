class Admin::TopicsController < Admin::BaseController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save
    flash[:notice] = "#{@topic.name} created successfully!"
    redirect_to admin_topics_path
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update(topic_params)
      flash[:notice] = "#{@topic.name} updated successfully!"
      redirect_to admin_topics_path
    else
      flash[:error] = 'Invalid Topic Name'
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    flash[:notice] = "#{@topic.name} deleted successfully!"
    redirect_to admin_topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end
end
