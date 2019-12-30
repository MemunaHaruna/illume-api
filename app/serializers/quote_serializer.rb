class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :content, :source_type, :source_title, :link_to_source, :is_qotd, :access

  belongs_to :user
  has_many :tags

  attribute :author do
    object.author.presence || 'Unknown'
  end
end
