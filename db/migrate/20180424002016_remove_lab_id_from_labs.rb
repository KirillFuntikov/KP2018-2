class RemoveLabIdFromLabs < ActiveRecord::Migration[5.1]
  def change
    remove_column :labs, :lab_id, :integer
  end
end
