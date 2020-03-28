class User < ApplicationRecord
    attachment :image
    has_many :invites
    has_many :members
    has_many :group_boards
    has_many :comments
    has_many :likes
    has_many :bookmarks
    has_many :tasks
    has_secure_password
    validates :password, length: { minimum: 6 }, allow_nil: true#あとでここ調べる
end
