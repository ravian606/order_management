class AddRecurringTillDateToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :recurring_end_date, :datetime
  end
end
