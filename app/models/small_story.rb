class SmallStory < ApplicationRecord
  belongs_to :story
  serialize :images, Array
  serialize :videos, Array
end
