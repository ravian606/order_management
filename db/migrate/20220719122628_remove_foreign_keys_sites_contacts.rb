class RemoveForeignKeysSitesContacts < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :sites, :companies
    remove_foreign_key :contacts, :companies
    remove_foreign_key :contacts, :sites
  end
end
