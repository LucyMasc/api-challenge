# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# ids = [123456, 456789, 852963, 852741]

# ids.each do |id|
#   Movie.create!(
#     id: id,
#     title: Faker::Movie.title,
#     genre: Movie,
#     year: 2020,
#     country: 'United States',
#     published_at: '2020-7-5' ,
#     description: Faker::Movies::BackToTheFuture.quote
#   )
# end

Movie.create!(
  id: 123456,
  title: Faker::Movie.title,
  genre: "Tv show",
  year: 2020,
  country: 'United States',
  published_at: '2020-7-5' ,
  description: Faker::Movies::BackToTheFuture.quote
)


Movie.create!(
  id: 456789,
  title: Faker::Movie.title,
  genre: "Movie",
  year: 2020,
  country: 'United States',
  published_at: '2020-7-5' ,
  description: Faker::Movies::BackToTheFuture.quote
)



Movie.create!(
  id: 852963,
  title: Faker::Movie.title,
  genre: "Movie",
  year: 2019,
  country: 'Brazil',
  published_at: '2020-7-5' ,
  description: Faker::Movies::BackToTheFuture.quote
)


Movie.create!(
  id: 852741,
  title: Faker::Movie.title,
  genre: "TV show",
  year: 2019,
  country: 'Brazil',
  published_at: '2020-7-5' ,
  description: Faker::Movies::BackToTheFuture.quote
)


Movie.create!(
  id: 249657,
  title: Faker::Movie.title,
  genre: "Movie",
  year: 2018,
  country: 'United States',
  published_at: '2020-7-5' ,
  description: Faker::Movies::BackToTheFuture.quote
)




