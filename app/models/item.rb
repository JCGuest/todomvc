class Item < ApplicationRecord
    validates :description, presence: true,  
    length: {maximum: 40}
    belongs_to :list
end
