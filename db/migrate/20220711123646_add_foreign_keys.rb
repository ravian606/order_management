class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :product, foreign_key: true
    add_reference :sites, :company, foreign_key: true
  end
end
