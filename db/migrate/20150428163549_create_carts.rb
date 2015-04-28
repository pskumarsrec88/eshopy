class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :product_id
      t.integer :quantity, :default => 1
      t.decimal :price, :default => 0
      t.decimal :value, :default => 0
      t.timestamps
    end
  end
end
