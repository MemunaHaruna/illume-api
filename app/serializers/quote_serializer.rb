class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :content, :source_type, :source_title, :link_to_source, :is_qotd, :access

  belongs_to :user
  has_many :tags

  attribute :author do
    object.author.presence || 'Unknown'
  end

  attribute :bookmarked_by_current_user do
    # object.bookmarked_by?(current_user) if current_user
    current_user.bookmarks.find_by(quote_id: object.id).present? if current_user
  end
end
