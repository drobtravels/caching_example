class Post < ActiveRecord::Base
  include DisplayOnMainPage
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
#
