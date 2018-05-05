class AddProcessingAtToLabs < ActiveRecord::Migration[5.1]
  def change
    add_column :labs, :processing_at, :date
  end
end
