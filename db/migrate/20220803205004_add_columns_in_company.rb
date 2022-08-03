class AddColumnsInCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :invoice_email, :string
    add_column :companies, :payment_method, :string
  end
end
