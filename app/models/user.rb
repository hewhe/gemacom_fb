class User < ApplicationRecord
    # attachment :image
    has_many :members, dependent: :destroy
    has_many :group_boards, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    has_many :tasks, dependent: :destroy
    has_secure_password

    validates :name, uniqueness: true, presence: true, allow_nil: true
    validates :password, length: { minimum: 6 }, allow_nil: true
end
