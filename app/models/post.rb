class Post < ActiveRecord::Base
  include DisplayOnMainPage
  include Topicable
  
  has_many :comments
  belongs_to :user
  scope :visible, -> { where(visible: true) }
end

# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  content    :text
#  visible    :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :integer
#
