class UpdateForeignKeyConstraintsForSitesAndContacts < ActiveRecord::Migration[6.0]
  def change
    #add_foreign_key :sites, :companies, on_delete: :cascade
  end
end
