class TopicsController < ApplicationController

  def index
    cache_key = "topic_index/#{Topic.maximum(:updated_at)}"
    @topics = Rails.cache.fetch(cache_key) do 
      Rails.logger.info "Querying for topics"
      topics_with_associations.all
    end
  end

  def show
    @topic = topics_with_associations.find(params[:id])
  end

  protected

  def topics_with_associations
    Topic.includes(:products, posts: :comments)
  end
end
