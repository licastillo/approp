class AddBodegaToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :bodega, :boolean
  end
end
