class PostSerializer < ActiveModel::Serializer
  TYPE = 'post'
  attributes :title, :content, :created_at, :user_name, :type

  def user_name
    object.user.try(:name)
  end

  def type
    TYPE
  end
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
