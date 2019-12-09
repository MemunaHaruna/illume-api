class NotFoundController < ApplicationController
  skip_before_action :authorize_api_request, only: :index

  def index
    json_error_response(message: "Oops! Looks like the page you're looking for is gone", status: :not_found)
  end
end
