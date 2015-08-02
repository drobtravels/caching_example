Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  resources :posts, only: [:index] do
    collection do
      get 'simple_cached_index'
    end
  end
end
