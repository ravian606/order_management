class RenameRecurringEndDate < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :recurring_end_date
    add_column :orders, :recurring_interval, :string
  end
end
