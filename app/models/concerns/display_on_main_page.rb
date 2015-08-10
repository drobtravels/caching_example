module DisplayOnMainPage
  extend ActiveSupport::Concern

  MAIN_PAGE_CACHE_KEY = 'current_main_page_cache_key'
  included do
    after_save :change_cache_key
    after_destroy :change_cache_key
  end

  def change_cache_key
    Rails.logger.info 'Expiring Cache for main page by changing cache key'
    Rails.cache.write(MAIN_PAGE_CACHE_KEY, SecureRandom.base64)
  end

  def self.current_cache_key
    Rails.cache.fetch(MAIN_PAGE_CACHE_KEY) { SecureRandom.base64 }
  end
end
