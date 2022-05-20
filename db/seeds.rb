# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

movies_serialized = URI.open("https://imdb-api.com/en/API/Top250TVs/k_5g2d8hyz").read
movies = JSON.parse(movies_serialized)
movies = movies["items"]
movies.first(92).each do |movie|
  imdb_id = movie["id"]
  plot_serialized = URI.open("https://imdb-api.com/en/API/Wikipedia/k_5g2d8hyz/#{imdb_id}").read
  plot = JSON.parse(plot_serialized)
  plot = plot["plotShort"]["plainText"]
  Movie.create(title: movie["title"],
               overview: plot,
               poster_url: movie["image"],
               rating: movie["imDbRating"],
               release_year: movie["year"],
               language: "en")
end

3.times do
  List.create(name: Faker::Book.unique.title)
end
