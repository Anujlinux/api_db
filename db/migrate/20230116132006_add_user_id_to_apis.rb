class AddUserIdToApis < ActiveRecord::Migration[6.1]
  def change
    add_column :apis, :user_id, :integer
    add_index :apis, :user_id
  end
end
