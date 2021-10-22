require 'rails_helper'

RSpec.describe Movie, type: :model do
  before :each do
    @file = fixture_file_upload( 'data.csv', 'csv')
  end

  describe 'import csv' do
    context 'when file is provided' do
      it 'import movies' do
        Movie.import(@file)
        expect(Movie.find_by(title: '13 Reasons Why').description)
          .to eq "After a teenage girl's perplexing suicide, a classmate receives a series of tapes that unravel the mystery of her tragic choice."
        expect(Movie.find_by(title: '13 Sins').description)
          .to eq "A man agrees to appear on a game show with a $6 million prize. But as the challenges become more extreme, he realizes he's made a grave mistake."
      end
    end
  end

  describe 'validates' do
    it 'title cannot be blank' do
      movie = Movie.new(description: 'A movie that makes you test your code')
      expect(movie).not_to be_valid
    end

    it 'description cannot be blank' do
      movie = Movie.new(title: 'Test your code')
      expect(movie).not_to be_valid
    end

    it 'records should have a unique title and description' do
      Movie.import(@file)
      movie = Movie.new(title: '13 Reasons Why', description: "After a teenage girl's perplexing suicide, a classmate receives a series of tapes that unravel the mystery of her tragic choice.")
      expect(movie).not_to be_valid
    end
  end
end

