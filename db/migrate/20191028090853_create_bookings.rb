class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :airplane, foreign_key: true
      t.integer :start_date
      t.integer :end_date
      t.integer :price
      t.boolean :approved

      t.timestamps
    end
  end
end
