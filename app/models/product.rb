class Product < ActiveRecord::Base
  include DisplayOnMainPage
  include Topicable
  
  scope :for_sale, -> { where(sellable: true) }
end

# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :decimal(, )
#  sellable    :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
