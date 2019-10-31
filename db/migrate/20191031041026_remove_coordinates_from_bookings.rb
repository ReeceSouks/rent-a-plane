class RemoveCoordinatesFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :latitude, :float
    remove_column :bookings, :longitude, :float
  end
end
