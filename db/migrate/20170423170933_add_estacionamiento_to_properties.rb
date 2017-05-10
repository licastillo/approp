class AddEstacionamientoToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :estacionamiento, :boolean
  end
end
