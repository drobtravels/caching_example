Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  resources :posts, only: [] do
    collection do
      get 'simple_cached_index'
      get 'time_based_cache_index'
      get 'update_time_based_cache_index'
    end
  end

  root 'home#all'

  resources :topics, only: [:index, :show]

  get 'api/products_and_posts_by_date', format: 'json'
  get 'api/products_and_posts_conditional', format: 'json'
  get 'api/products', fromat: 'json'
end
