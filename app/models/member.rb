class Member < ApplicationRecord
    belongs_to :user
    belongs_to :group

    enum flag: [:admin, :guest]#他にも副管理人とか作るかも
end
