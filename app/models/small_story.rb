class SmallStory < ApplicationRecord
  belongs_to :story
  serialize :images, Array
  serialize :videos, Array
  has_many :comments, as: :commentable
end
