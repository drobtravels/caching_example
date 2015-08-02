class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user
      t.string :title
      t.text :content
      t.boolean :visible, default: true

      t.timestamps null: false
    end
  end
end
