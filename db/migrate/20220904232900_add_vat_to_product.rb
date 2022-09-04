class AddVatToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :vat, :integer, :default => 0
  end
end
