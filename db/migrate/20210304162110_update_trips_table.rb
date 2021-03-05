class UpdateTripsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column(:trips, :traveled?, :boolean)
  end
end

##can i add another migration with the same class name?