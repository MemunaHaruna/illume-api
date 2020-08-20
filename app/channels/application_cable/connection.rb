module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :uuid

    def connect
      # just a unique identifier, not currently used anywhere
      self.uuid = SecureRandom.urlsafe_base64
    end
  end
end
