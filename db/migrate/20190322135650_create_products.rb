class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.decimal :price, null: false, precision: 5, scale: 2

      t.timestamps
    end
  end
end
