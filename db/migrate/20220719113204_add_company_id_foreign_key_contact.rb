class AddCompanyIdForeignKeyContact < ActiveRecord::Migration[6.0]
  def change
    add_reference :contacts, :company, foreign_key: true
  end
end
