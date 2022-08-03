class AddAttributesInCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :number, :string
    add_column :companies, :street_address_one, :string
    add_column :companies, :street_address_two, :string
    add_column :companies, :town, :string
    add_column :companies, :post_code, :string
    add_column :companies, :head_office, :string
    add_column :companies, :invoice_address, :string
    add_column :companies, :contact, :string
  end
end
