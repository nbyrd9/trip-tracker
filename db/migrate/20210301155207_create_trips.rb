class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :country
      t.string :city
      t.datetime :travel_dates
      t.boolean :traveled?
    
      t.integer :user_id
    end
  end
end
