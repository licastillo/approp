class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :property, foreign_key: true

      t.timestamps
    end
  end
end
