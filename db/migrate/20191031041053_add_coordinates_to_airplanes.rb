class AddCoordinatesToAirplanes < ActiveRecord::Migration[5.2]
  def change
    add_column :airplanes, :latitude, :float
    add_column :airplanes, :longitude, :float
  end
end
