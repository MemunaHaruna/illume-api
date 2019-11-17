class HomeController < ApplicationController
  skip_before_action :authorize_api_request, only: :index

  def index
    json_basic_response(message: "Welcome to Illume!")
  end
end
