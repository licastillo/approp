class AddHabitacionesBaniosToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :habitaciones, :integer
    add_column :properties, :banios, :integer
  end
end
