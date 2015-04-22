class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :quantity, :default => 1
      t.decimal :price, :default => 0
      t.decimal :value, :default => 0
      t.boolean :status, :default => false

      t.timestamps
    end
  end
end
