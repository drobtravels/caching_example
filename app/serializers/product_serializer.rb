class ProductSerializer < ActiveModel::Serializer
  TYPE = 'product'
  attributes :name, :description, :price, :type

  def type
    TYPE
  end
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
#  topic_id    :integer
#
