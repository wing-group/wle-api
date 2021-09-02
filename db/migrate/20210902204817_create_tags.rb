class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.references :user, foreign_key: true, null: false
      t.references :verse, foreign_key: true, null: false
      t.references :topic, foreign_key: true, null: false

      t.timestamps
    end
  end
end
