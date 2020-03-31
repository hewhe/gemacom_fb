class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id, index: true, foreign_key: true, null: false
      t.integer :group_board_id, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
