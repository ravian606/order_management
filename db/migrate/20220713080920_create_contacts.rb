class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :number
      t.string :street_address1
      t.string :street_address2
      t.string :town
      t.string :post_code_string
      t.string :email
      t.string :phone_number
      t.string :head_office
      t.string :buyer
      t.string :invoice
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end
