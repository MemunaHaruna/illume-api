class User < ApplicationRecord
  def self.find_or_create_from_auth_hash(auth)
    where(provider: auth.provider, unique_id: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.unique_id = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.avatar_url = auth.info.image
      user.save!
    end
  end
end
