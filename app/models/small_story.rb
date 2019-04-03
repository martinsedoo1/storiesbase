class SmallStory < ApplicationRecord

  validates :title,
            :description,
            :longitude,
            :latitude,
            :story,
            presence: true
  validates :title, length: { in: 2..100 }
  validates :description, length: { in: 1..30_000 }
  validates :longitude, numericality: true
  validates :latitude, numericality: true

  belongs_to :story
  serialize :images, Array
  serialize :videos, Array
  has_many :comments, as: :commentable
end
