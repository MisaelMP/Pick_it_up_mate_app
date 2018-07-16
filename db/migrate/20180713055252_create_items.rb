class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :title
      t.text :location
      t.float :latitude
      t.float :longitude
      t.text :image
      t.text :condition

      t.timestamps
    end
  end
end
