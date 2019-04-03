class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :content,
  presence: true
validates :content, length: { in: 1..30_000 }

end
