class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :sku
      t.boolean :is_seasonal
      t.string :image
      t.integer :quantity
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
