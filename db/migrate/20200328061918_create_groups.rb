class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :group_category_id, index: true, foreign_key: true, null: false
      t.string :name, null: false
      t.text :profile
      t.string :image_id

      t.timestamps
    end
  end
end
