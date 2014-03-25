class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.decimal :price
      t.date :released_on
      t.integer :view_count

      t.timestamps
    end
    add_index :products, :category_id
  end
end
