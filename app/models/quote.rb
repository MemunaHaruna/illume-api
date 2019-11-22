class Quote < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags

  enum access: %w[open hidden]
  enum source_type: %w[Original, Book, Movie, Song, Talk, Article, Journal, Other]

  scope :visible, -> (current_user){ open.or(where(user: current_user))}
end
