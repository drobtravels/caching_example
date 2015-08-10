class Topic < ActiveRecord::Base
  has_many :posts
  has_many :products
end

# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
