class CreateAirplanes < ActiveRecord::Migration[5.2]
  def change
    create_table :airplanes do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.string :airport
      t.integer :price_per_day
      t.string :title
      t.string :photo

      t.timestamps
    end
  end
end
