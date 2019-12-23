class SessionsController < ApplicationController
  skip_before_action :authorize_api_request

  def create
    user = User.find_or_create_from_auth_hash auth_hash

    token = Auth::AuthenticateUser.new(user.id).call
    response = {
      token: token,
      user: UserSerializer.new(user),
      message: 'Successfully logged in'
    }.to_json
    ActionCable.server.broadcast("auth_channel_#{socket_id}", response)
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

  def socket_id
    params[:socketId] || request.env["omniauth.params"]["socketId"]
  end
end

