class AddDireccionAproxToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :direccion_aprox, :boolean, default: false
  end
end
