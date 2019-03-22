class AddTotalPurchasesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :total_purchases, :integer, default: 0, null: false
  end
end
