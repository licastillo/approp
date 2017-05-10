class AddToctocCharsToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :amoblado, :boolean
    add_column :properties, :condominio, :boolean
    add_column :properties, :superficie_construida, :integer
    add_column :properties, :superficie_terreno, :integer
    add_column :properties, :caracteristicas, :text, array: true, default: []
  end
end
