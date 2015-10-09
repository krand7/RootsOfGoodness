class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.string :name
      t.string :email
      t.string :photo
      t.integer :trees, null: false, default: 0
      t.boolean :deleted, null: false, default: false
      t.integer :view_count, null: false, default: 0

      t.timestamps null: false
    end
  end
end
