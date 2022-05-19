# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

9.times do
  Movie.create(title: Faker::Movie.title, overview: Faker::TvShows::BojackHorseman.quote, poster_url: Faker::Internet.url, rating: rand(0..10) )
end
