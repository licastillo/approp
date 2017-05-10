class RemoveTipoDireccionFromProperties < ActiveRecord::Migration[5.0]
  def change
    remove_column :properties, :tipo_direccion
  end
end
