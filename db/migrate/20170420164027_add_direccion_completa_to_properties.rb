class AddDireccionCompletaToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :direccion_completa, :string
  end
end
