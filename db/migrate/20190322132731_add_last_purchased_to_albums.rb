class AddLastPurchasedToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :last_purchased_at, :timestamp, default: nil
    add_column :albums, :last_purchased_by, :string, default: nil
  end
end
