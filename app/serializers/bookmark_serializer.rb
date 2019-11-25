class BookmarkSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :quote
  belongs_to :user
end
