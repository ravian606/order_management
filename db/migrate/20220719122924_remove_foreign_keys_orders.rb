class RemoveForeignKeysOrders < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :orders, :sites
    remove_foreign_key :orders, :users
    remove_foreign_key :product_order_details, :orders
    remove_foreign_key :product_order_details, :products
  end
end
