class GroupBoard < ApplicationRecord
    belongs_to :user
    belongs_to :group
    has_many :comments
    has_many :board_images
    has_many :likes
    has_many :bookmarks

    enum flag: [:雑談, :募集, :お知らせ]
end
