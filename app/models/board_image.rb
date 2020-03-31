class BoardImage < ApplicationRecord
    attachment :image
    belongs_to :group_board
end
