class User < ApplicationRecord
  has_many :quotes
  has_many :bookmarks

  validates_presence_of :email, :provider, :unique_id
  # validates_uniqueness_of :email

  def self.find_or_create_from_auth_hash(auth)
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.unique_id = auth.uid
      user.first_name = auth.info.first_name || user.first_name
      user.last_name = auth.info.last_name || user.last_name
      user.email = auth.info.email
      user.avatar_url = auth.info.image
      user.save!
    end
  end

  def self.send_qotd_notification!
    # TO-DO
    # Fetch the qotd from the DB
    # Send actioncable notification
  end
end
