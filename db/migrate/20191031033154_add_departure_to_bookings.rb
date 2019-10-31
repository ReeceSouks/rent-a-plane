class AddDepartureToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :departure, :string
  end
end
