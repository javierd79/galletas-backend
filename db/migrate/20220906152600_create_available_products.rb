class CreateAvailableProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :available_products do |t|
      t.string :name
      t.string :description
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
