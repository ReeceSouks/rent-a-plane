# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airplanes = ["Airbus A320 family", "Boeing 747", "G5", "G3", "Cessna", "Boeing 737", "Boeing 797", "Learjet 60", "Bombardier Global 6000", "Embraer Legacy 650", "Embraer Phenom 100"]
cities = ["New York", "Boston", "Los Angeles"]
User.create(email: 'test@gmail.com', password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name )

20.times do
  user = User.create(email: Faker::Internet.email, password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name )
end
puts "users ok"
20.times do
  airplane = Airplane.create(user: User.all.sample,  description: Faker::Lorem.paragraph, airport: Faker::Nation.capital_city, price_per_day: rand(5000..20000), title: airplanes.sample )
end
puts "airplanes created ok"

20.times do
  booking = Booking.create(user: User.all.sample, airplane: Airplane.all.sample, price: rand(5000..20000), approved: false , start_date: Date.today + rand(10...20), end_date: Date.today + rand(21...30) )
end
puts "Bookings created ok"

20.times do
  review = Review.create(booking: Booking.all.sample, rating: rand(1..5), content: Faker::Lorem.paragraph)
end


  # create_table "reviews", force: :cascade do |t|
  #   t.bigint "booking_id"
  #   t.integer "rating"
  #   t.text "content"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["booking_id"], name: "index_reviews_on_booking_id"
  # end

    # t.bigint "user_id"
    # t.text "description"
    # t.string "airport"
    # t.integer "price_per_day"
    # t.string "title"
    # t.string "photo"

  # create_table "bookings", force: :cascade do |t|
  #   t.bigint "user_id"
  #   t.bigint "airplane_id"
  #   t.integer "price"
  #   t.boolean "approved"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.date "start_date"
  #   t.date "end_date"
  #   t.index ["airplane_id"], name: "index_bookings_on_airplane_id"
  #   t.index ["user_id"], name: "index_bookings_on_user_id"
  # end
