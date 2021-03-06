class Movie < ApplicationRecord
  validates :title, :description, presence: true, uniqueness: true

  def self.import(file)
    CSV.foreach(file.path, 'r:bom|utf-8', headers: true, col_sep: ',', quote_char: '"') do |row|
       Movie.where(title: row[1]).first_or_create! row.to_hash
    end
  end
end
