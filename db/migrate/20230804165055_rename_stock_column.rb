class RenameStockColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :stock, :inventory
  end
end
