class AddUserIdToLabs < ActiveRecord::Migration[5.1]
  def change
    add_column :labs, :user_id, :integer
  end
end
