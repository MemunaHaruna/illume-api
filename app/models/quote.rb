class Quote < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_and_belongs_to_many :tags

  enum access: %w[open hidden]
  enum source_type: %w[Original, Book, Movie, Song, Talk, Article, Journal, Other]

  scope :visible_to, -> (current_user){ open.or(where(user: current_user))}
  scope :recent_first, -> { order("id DESC") }
end
