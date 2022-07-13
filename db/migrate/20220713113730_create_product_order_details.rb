class CreateProductOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :product_order_details do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.string :quantity
      t.string :special_instructions

      t.timestamps
    end
  end
end
