require 'rails/application_controller'

class PagesController < Rails::ApplicationController
  def index

    render file: 'app/views/pages/index.html'
    # @movies = Movie.all
    # respond_to do |format|
    #   format.csv {send_data @movies.to_csv}
    # end
  end

  def import
   Movie.import(params[:file])
   redirect_to root_url, notice: "Movies imported."
  end



  private

  def movies_doc_params
    params.require(:movie).permit(:document)
  end
end
