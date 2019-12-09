class Api::SessionsController < ApplicationController
  skip_before_action :authorize_api_request, only: :create

  def create
    user = User.find_or_create_from_auth_hash auth_hash

    token = Auth::AuthenticateUser.new(user.id).call
    json_auth_response(token: token, message: 'Successfully logged in')
  rescue => error
    json_error_response(message: "Error logging in", errors: error)
  end

  def destroy
    json_auth_response(message: "Successfully logged out")
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end
end

