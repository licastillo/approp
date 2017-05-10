class RenamePrecioCentavosColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :properties, :precio_centavos, :precio_pesos
  end
end
