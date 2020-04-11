class Group < ApplicationRecord
    attachment :image
    has_many :members
    has_many :group_boards
    belongs_to :group_category

    validates :name, presence: true
    validates :group_category_id, presence: true
    validates :image, presence: true
end
