class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.integer :user_id, index: true, foreign_key: true, null: false
      t.integer :invite_category_id, index: true, foreign_key: true, null: false
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
