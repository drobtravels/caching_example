class TopicsController < ApplicationController

  def index
    @topics = topics_with_associations.all
  end

  def show
    @topic = topics_with_associations.find(params[:id])
  end

  protected

  def topics_with_associations
    Topic.includes(:posts, :products)
  end
end
