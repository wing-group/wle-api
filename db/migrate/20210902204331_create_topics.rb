class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :topic, null: false
      t.text :description, null: true

      t.timestamps
    end
  end
end
