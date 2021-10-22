require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :request do
  describe 'GET /movies?query=' do
    before(:each) do
      Movie.create!(title: 'Titanic', genre: "Movie", release_year: 2018, country: 'United States', published_at: '2020-7-5' , description: '101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later.')
      Movie.create!(title: 'Wonder Woman', genre: "Tv Show", release_year: 2020, country: 'United States', published_at: '2018-7-5' , description: 'When a pilot crashes and tells of conflict in the outside world, Diana, an Amazonian warrior in training, leaves home to fight a war, discovering her full powers and true destiny.')
    end

    let(:genre) { 'Movie' }
    let(:year) { 2018 }
    let(:country) { 'United States' }

    it 'Should return all movies' do
      get '/movies'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["data"].count).to eq(2)
    end

    it 'should return movies with same genre' do
      get "/movies?query=#{genre}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["data"].count).to eq(1)
    end

    it 'should return movies with same year' do
      get "/movies?query=#{year}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["data"].count).to eq(1)
    end

    it 'should return movies from same country' do
      get "/movies?query=#{country}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)["data"].count).to eq(2)
    end
  end
end
