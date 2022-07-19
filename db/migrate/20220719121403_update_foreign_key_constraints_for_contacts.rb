class UpdateForeignKeyConstraintsForContacts < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :contacts, :companies
    remove_foreign_key :contacts, :sites

    add_foreign_key :contacts, :companies, on_delete: :cascade
    add_foreign_key :contacts, :sites, on_delete: :cascade
  end
end
