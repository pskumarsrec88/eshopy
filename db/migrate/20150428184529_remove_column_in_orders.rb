class RemoveColumnInOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :product_id
    remove_column :orders, :quantity
    remove_column :orders, :price
  end
end
