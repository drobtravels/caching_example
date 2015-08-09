class ApiController < ApplicationController
  layout false

  def products_and_posts_by_date
    Rails.logger.info 'querying for new products and posts'
    posts = Post.visible.includes(:user)
    products = Product.for_sale
    products_and_posts = (products + posts).sort_by(&:created_at).reverse
    render json: products_and_posts
  end
end
