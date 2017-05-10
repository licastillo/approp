class CreatePropertyPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :property_photos do |t|
      t.string :photo
      t.integer :property_id
      t.boolean :hero

      t.timestamps
    end
  end
end
