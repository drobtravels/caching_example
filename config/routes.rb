Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  resources :posts, only: [:index] do
    collection do
      get 'simple_cached_index'
      get 'time_based_cache'
      get 'update_time_based_cache'
    end
  end

  get 'api/products_and_posts_by_date'
end
