class List < ApplicationRecord
    validates :name, presence: true, 
    uniqueness: { case_sensitive: false }, 
    length: {maximum: 20}
    has_many :items
end
