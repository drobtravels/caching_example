class ApiController < ApplicationController
  layout false

  def products_and_posts_by_date
    products_and_posts = Rails.cache.fetch(DisplayOnMainPage.current_cache_key) do
      Rails.logger.info 'querying for new products and posts'
      posts = Post.visible.includes(:user)
      products = Product.for_sale
      (products + posts).sort_by(&:created_at).reverse
    end
    
    render json: products_and_posts
  end
end
