class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :group_board

    validates :content, presence: true
end
