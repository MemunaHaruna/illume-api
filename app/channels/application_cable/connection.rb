module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_connection

    def connect
      # not actually using this since I'm doing stream_from, not stream_for
      # leaving it here so I can reference later
      self.current_connection = cookies[:current_connection_token]
    end
  end
end
