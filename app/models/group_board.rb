class GroupBoard < ApplicationRecord
    belongs_to :user
    belongs_to :group
    has_many :comments
    has_many :board_images
    has_many :likes
    has_many :bookmarks
end
