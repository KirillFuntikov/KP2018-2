class AddDoneAtToLabs < ActiveRecord::Migration[5.1]
  def change
    add_column :labs, :done_at, :date
  end
end
