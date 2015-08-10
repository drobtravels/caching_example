module Topicable
  extend ActiveSupport::Concern

  included do
    # touch updates topic allowing for russian doll caching
    belongs_to :topic, touch: true
  end
end
