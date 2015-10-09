class CreateTributes < ActiveRecord::Migration
  def change
    create_table :tributes do |t|
      t.integer :receiver_id
      t.text :description
      t.string :created_by
      t.string :email
      t.boolean :anonymous, null: false, default: false
      t.integer :trees, null: false, default: 0
      t.boolean :deleted, null: false, default: false
      t.string :status, null: false, default: 'pending'
      t.integer :view_count, null: false, default: 0

      t.timestamps null: false
    end

    add_index :tributes, :receiver_id
  end
end
