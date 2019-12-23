class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :avatar_url, :provider, :created_at

  attribute :name do
    object.first_name || object.last_name || object.email.split('@').first
  end
end

