class Story < ApplicationRecord
  validates :title,
  :description,
  :category,
  :user,
  presence: true
  validates :title, length: { in: 1..100 }
  validates :description, length: { in: 1..35_000 }
  belongs_to :user
  belongs_to :category
  has_many :small_stories
  has_many :comments, as: :commentable
end
