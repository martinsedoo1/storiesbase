class Category < ApplicationRecord
    has_many :stories

    validates :name,
    presence: true
    validates :name, length: { in: 1..50 }

end
