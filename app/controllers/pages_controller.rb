require 'rails/application_controller'

class PagesController < Rails::ApplicationController
  def index
    render file: 'app/views/pages/index.html'
  end
end
