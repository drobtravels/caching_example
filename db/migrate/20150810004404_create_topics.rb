class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name, index: { unique: true }

      t.timestamps null: false
    end
  end
end
