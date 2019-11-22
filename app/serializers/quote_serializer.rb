class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :content, :author, :source_type, :source_title, :link_to_source

  belongs_to :user
  has_many :tags
end
