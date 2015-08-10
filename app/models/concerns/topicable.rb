module Topicable
  extend ActiveSupport::Concern

  included do
    belongs_to :topic
  end
end
