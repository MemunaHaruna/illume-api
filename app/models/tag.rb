class Tag < ApplicationRecord
  has_and_belongs_to_many :quotes

  validates_presence_of :name
  validates_uniqueness_of :name

  before_save :titlecase_name

  def self.filter_by_name(query)
    where("name LIKE ?", "%#{query.titlecase}%")
  end

  def titlecase_name
    self.name = name.titlecase
  end
end
