class AuthChannel < ApplicationCable::Channel
  def subscribed
    stream_from "auth_channel_#{params[:socket_id]}"
  end

  def unsubscribed
  end
end
