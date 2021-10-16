class Movie < ApplicationRecord
  # has_one_attached :document
  validates :title, :description, uniqueness: true
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Movie.create! row.to_hash
    end
  end

end
