class CreateProductsCarritos < ActiveRecord::Migration[7.0]
  def change
    create_table :products_carritos do |t|
      t.references :carrito, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
