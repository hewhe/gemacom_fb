class User < ApplicationRecord
    # attachment :image
    has_many :members
    has_many :group_boards
    has_many :comments
    has_many :likes
    has_many :bookmarks
    has_many :tasks
    has_secure_password

    validates :name, uniqueness: true, presence: true, allow_nil: true
    validates :password, length: { minimum: 6 }, allow_nil: true
end
