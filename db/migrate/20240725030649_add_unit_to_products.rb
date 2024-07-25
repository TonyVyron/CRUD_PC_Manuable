class AddUnitToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :unit, :string
  end
end
