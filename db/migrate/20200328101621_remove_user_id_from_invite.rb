class RemoveUserIdFromInvite < ActiveRecord::Migration[5.2]
  def change
    remove_column :invites, :user_id, :integer
  end
end
