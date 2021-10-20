module Api
  module V1
    class MoviesController < ApplicationController
      def index
        if params[:query].present?
          sql_query = "genre ILIKE :query OR year ILIKE :query OR country ILIKE :query"
          @movies = Movie.where(sql_query, query: "%#{params[:query]}%")
          render json: { status: 'SUCCESS', message: "Loaded movies by #{params[:query]}", data: @movies}, status: :ok
        else
          # @movies = Movie.all
          @movies = Movie.order('published_at DESC')
          render json: { status: 'SUCCESS', message: 'Loaded movies', data: @movies}, status: :ok
        end
      end
    end
  end
end
