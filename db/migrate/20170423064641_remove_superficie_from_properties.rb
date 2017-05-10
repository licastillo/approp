class RemoveSuperficieFromProperties < ActiveRecord::Migration[5.0]
  def change
    remove_column :properties, :superficie
  end
end
