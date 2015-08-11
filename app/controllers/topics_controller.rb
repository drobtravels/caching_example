class TopicsController < ApplicationController

  def index
    @cache_key = "topic_index/#{Topic.maximum(:updated_at)}"
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end
end
