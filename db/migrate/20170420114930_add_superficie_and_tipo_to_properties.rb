class AddSuperficieAndTipoToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :superficie, :integer
    add_column :properties, :tipo, :string
  end
end
