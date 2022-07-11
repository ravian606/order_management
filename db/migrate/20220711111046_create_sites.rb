class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :number
      t.string :street_address_one
      t.string :street_address_two
      t.string :town
      t.string :post_code
      t.string :head_office
      t.string :invoice_address
      t.string :contact
      t.string :invoice_email
      t.string :phone_number
      t.string :payment_method

      t.timestamps
    end
  end
end
