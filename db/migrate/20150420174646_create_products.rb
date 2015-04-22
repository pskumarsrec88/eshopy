class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price, :default => 0
      t.string :url
      t.boolean :active, :default => true
      t.timestamps
    end
  end
end
