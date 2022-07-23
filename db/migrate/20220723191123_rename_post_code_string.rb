class RenamePostCodeString < ActiveRecord::Migration[6.0]
  def change
    rename_column :contacts, :post_code_string, :post_code
  end
end
