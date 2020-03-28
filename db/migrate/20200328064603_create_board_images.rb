class CreateBoardImages < ActiveRecord::Migration[5.2]
  def change
    create_table :board_images do |t|
      t.integer :group_board_id, index: true, foreign_key: true, null: false
      t.string :image_id

      t.timestamps
    end
  end
end
