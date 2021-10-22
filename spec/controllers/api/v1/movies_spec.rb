require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :request do
  describe 'GET /movies?query=' do
    before :each do
      @file = fixture_file_upload( 'data.csv', 'csv')
      Movie.import(@file)
    end

    let(:genre) { 'Movie' }
    let(:release_year) { '2014' }
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

    it 'should return movies released within the same year' do
      get "/movies?query=#{release_year}"
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
