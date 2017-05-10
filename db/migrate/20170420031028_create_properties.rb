class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :titulo
      t.text :descripcion
      t.string :direccion
      t.integer :tipo_direccion
      t.float :lat
      t.float :lng
      t.integer :precio_centavos
      t.string :moneda
      t.integer :user_id

      t.timestamps
    end
  end
end
