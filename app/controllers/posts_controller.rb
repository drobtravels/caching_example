class PostsController < ApplicationController

  def index
    @posts = posts_query
  end

  # NOTE: This is naieve implementation
  def simple_cached_index
    @posts = Rails.cache.fetch(:simple_index) do
      posts_query
    end
    render :index
  end

  protected

  def posts_query
    Rails.logger.info 'executing query for posts'
    Post.visible.includes(:user)
  end
end
