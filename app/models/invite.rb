class Invite < ApplicationRecord
    belongs_to :user
    belongs_to :invite_category
end
