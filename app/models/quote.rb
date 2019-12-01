class Quote < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_and_belongs_to_many :tags

  validates_presence_of :content

  enum access: %w[open hidden]
  enum source_type: %w[Original, Book, Movie, Song, Talk, Article, Journal, Other]

  scope :visible_to, -> (current_user){ open.or(where(user: current_user))}
  scope :recent_first, -> { order("id DESC") }

  before_save :titlecase_author_and_title

  def self.set_quote_of_the_day!
    current_qotd = Quote.find_by(is_qotd: true)
    current_qotd.update(is_qotd: false) if current_qotd

    sql = "SELECT quote_id FROM bookmarks GROUP BY quote_id ORDER BY COUNT(quote_id) DESC LIMIT 1"
    quote_id = ActiveRecord::Base.connection.execute(sql)[0]["quote_id"]
    find(quote_id).update(is_qotd: true)

    # Should this be saved in the database? yes, until I can find a better way
    # How to resolve the issue where the same qotd may appear on more than 1 day since it depends on no. of bookmarks?
    # What if no quote has been bookmarked?
  end

  def titlecase_author_and_title
    self.author = author.titlecase if author
    self.source_title = source_title.titlecase if source_title
  end
end
