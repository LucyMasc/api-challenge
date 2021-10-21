class Movie < ApplicationRecord
  validates :title, :description, uniqueness: true

  def self.import(file)

    CSV.foreach(file.path, 'r:bom|utf-8', headers: true, col_sep: ',', quote_char: '"') do |row|

      Movie.create! row.to_hash
  #
  #     # quote_char: "\x00", col_sep: "\t",

      #  Movie.create!(
      #   show_id: row['show_id'],
      #   title: row['title'],
      #   movie_type: row['movie_type'],
      #   director: row['director'],
      #   cast: row['cast'],
      #   country: row['country'],
      #   date_added: row['date_added'],
      #   release_year: row['release_year'],
      #   rating: row['rating'],
      #   duration: row['duration'],
      #   listed_in: row['listed_in'],
      #   description: row['description'],


      # )

    end
    #   Movie.import(movies)
  end


end
