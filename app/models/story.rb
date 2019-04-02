class Story < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :small_stories
  has_many :comments, as: :commentable
end
