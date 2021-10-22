module Api
  module V1
    class MoviesController < ApplicationController
      def index
        if params[:query].present?
          sql_query = "movie_type ILIKE :query OR release_year ILIKE :query OR country ILIKE :query"
          @movies = Movie.where(sql_query, query: "%#{params[:query]}%")
          render json: { status: 'SUCCESS', message: "Loaded movies by #{params[:query]}", data: @movies}, status: :ok
        else
          @movies = Movie.order('release_year DESC')
          render json: { status: 'SUCCESS', message: 'Loaded movies', data: @movies}, status: :ok
        end
      end

      def import
        begin
          Movie.import(params[:file])
          render json: { status: 'Success', message: 'Products successfully imported. Check it out on /movies' }, status: :ok
        rescue ActiveRecord::RecordInvalid
          render json: { status: 'ERROR', message: 'Not able to import products.', data: [] }, status: :unprocessable_entity
        end
      end
    end
  end
end
