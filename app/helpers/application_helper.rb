module ApplicationHelper

  def posts_cache_key
    "posts/#{Post.maximum(:updated_at)}"
  end

  def products_cache_key
    "products/#{Product.maximum(:updated_at)}"
  end
end
