class AddRecurringAttributesToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :is_recurring, :boolean, default: false
    add_column :orders, :repeat_interval, :string
    add_column :orders, :delievery_date, :datetime
  end
end
