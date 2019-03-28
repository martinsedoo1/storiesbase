class Story < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :small_stories
end
