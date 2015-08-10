class AddTopicToProductsAndPosts < ActiveRecord::Migration
  def change
    add_column :products, :topic_id, :integer, foreign_key: true
    add_column :posts, :topic_id, :integer, foreign_key: true
  end
end
