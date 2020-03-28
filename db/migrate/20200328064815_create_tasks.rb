class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id, index: true, foreign_key: true, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
