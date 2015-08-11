class PostsController < ApplicationController


  # This is naive implementation
  def simple_cached_index
    @posts =  posts_query
  end

  # This is also a naive implementation
  def time_based_cache_index
    @posts = posts_query
  end

  # NOTE:  Table should be insert/update only (No deletes!)
  def update_time_based_cache_index
    @cache_key = "posts/#{Post.maximum(:updated_at)}"
    @posts = posts_query
  end

  protected

  def posts_query
    Post.visible.includes(:user)
  end
end
