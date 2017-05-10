class AddOperacionToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :operacion, :integer, default: 0
  end
end
