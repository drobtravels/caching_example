class Comment < ActiveRecord::Base
  belongs_to :post, touch: true
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :text
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
