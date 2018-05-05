class AddDeadlineToLabs < ActiveRecord::Migration[5.1]
  def change
    add_column :labs, :deadline, :date
  end
end
