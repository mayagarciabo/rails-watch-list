# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Movie.destroy_all
List.destroy_all
Bookmark.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated"
movies = JSON.parse(URI.open(url).read)

movies["results"].each do |movie|
  data = {
    title: movie["title"],
    overview: movie["overview"],
    rating: movie["vote_average"],
    poster_url: "https://image.tmdb.org/t/p/w200/#{movie["poster_path"]}"
  }
  Movie.create!(data)
end
