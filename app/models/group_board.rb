class GroupBoard < ApplicationRecord
    belongs_to :user
    belongs_to :group
    has_many :comments, dependent: :destroy
    has_many :board_images, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :bookmarks, dependent: :destroy

    enum flag: [:雑談, :募集, :お知らせ]

    validates :content, presence: true
    validates :flag, presence: true
end
