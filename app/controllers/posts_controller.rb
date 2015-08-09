class PostsController < ApplicationController

  def index
    @posts = posts_query
  end

  # This is naive implementation
  def simple_cached_index
    @posts = Rails.cache.fetch(:simple_index) do
      posts_query
    end
    render :index
  end

  # This is also a naive implementation
  def time_based_cache
    @posts = Rails.cache.fetch(:simple_index, expires_in: 1.minute) do
      posts_query
    end
    render :index
  end

  # NOTE:  Table should be insert/update only (No deletes!)
  def update_time_based_cache
    cache_key = Post.maximum(:updated_at).to_s
    @posts = Rails.cache.fetch(cache_key) do
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
