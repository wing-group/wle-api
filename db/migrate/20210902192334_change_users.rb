class ChangeUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :email, :string, null: false
    change_column :users, :password_digest, :string, null: false

    change_table :users do |t|
      t.string :display, null: true
      t.integer :access_level, default: 0, null: false
      t.integer :default_version, default: 0, null: false
    end
  end
end
