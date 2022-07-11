class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :size
      t.string :packaging
      t.text :description
      t.string :price

      t.timestamps
    end
  end
end
