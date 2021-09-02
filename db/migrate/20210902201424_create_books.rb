class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :book_lookup, limit: 5, null: false
      t.string :name, limit: 16, null: false
      t.integer :chapters, null: false

      t.timestamps
    end
  end
end
