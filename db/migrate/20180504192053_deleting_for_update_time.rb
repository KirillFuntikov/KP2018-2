class DeletingForUpdateTime < ActiveRecord::Migration[5.1]
  def change
    remove_column :labs, :processing_at, :date
    remove_column :labs, :done_at, :date
  end
end
