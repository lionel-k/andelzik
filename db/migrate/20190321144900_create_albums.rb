class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.string :performer, null: false
      t.integer :cost, null: false

      t.timestamps
    end
  end
end
