module Api
  module V1
    class MoviesController < ApplicationController
      CSV_OPTIONS = { col_sep: ',', quote_char: '"', headers: :first_row }
      def index
        if params[:query].present?
          sql_query = "movie_type ILIKE :query OR release_year ILIKE :query OR country ILIKE :query"
          @movies = Movie.where(sql_query, query: "%#{params[:query]}%")
          render json: { status: 'SUCCESS', message: "Loaded movies by #{params[:query]}", data: @movies}, status: :ok
        else
          # @movies = Movie.all
          @movies = Movie.order('release_year DESC')
          render json: { status: 'SUCCESS', message: 'Loaded movies', data: @movies}, status: :ok
        end
      end


      def import
        Movie.import(params[:file])
        # .force_encoding("cp1251").encode("utf-8")
        # .open("input_file", "r:ISO-8859-1")

        redirect_to pages_path, notice: "Movies imported."
      end
    end
  end
end
