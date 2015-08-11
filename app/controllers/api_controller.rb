class ApiController < ApplicationController
  layout false

  def products
    cache_key = "products/#{Product.maximum(:created_at)}"
    products = Rails.cache.fetch(cache_key) do
      Rails.logger.info 'querying for products and building json'
      Product.for_sale.to_json
    end

    render json: products
  end

  def products_and_posts_by_date
    render json: products_and_posts
  end

  def products_and_posts_conditional
    etag = DisplayOnMainPage.current_cache_key
    if stale?(etag)
      Rails.logger.info 'Rendering products and posts'
      render json: products_and_posts
    end
  end

  protected

  def products_and_posts
    Rails.cache.fetch(DisplayOnMainPage.current_cache_key) do
      Rails.logger.info 'querying for new products and posts'
      posts = Post.visible.includes(:user)
      products = Product.for_sale
      (products + posts).sort_by(&:created_at).reverse.to_json
    end
  end
end
