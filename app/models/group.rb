class Group < ApplicationRecord
    attachment :image
    has_many :members
    has_many :group_boards
    belongs_to :group_category
end
