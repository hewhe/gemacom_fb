class Invite < ApplicationRecord
    belongs_to :invite_category

    validates :title, presence: true
    validates :content, presence: true
end
