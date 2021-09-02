class CreateVerses < ActiveRecord::Migration[6.1]
  def change
    create_table :verses do |t|
      t.string :verse_lookup, limit: 13, null: false
      t.references :book, foreign_key: true, null: false
      t.integer :chapter, null: false
      t.integer :verse, null: false

      t.timestamps
    end
  end
end
