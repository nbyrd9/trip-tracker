class CreateTouristAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :tourist_attractions do |t|
      t.string :name
      t.string :category
      t.float :price

      t.integer :trip_id
    end
  end
end
