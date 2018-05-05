class AddingProcessingAtToLabs < ActiveRecord::Migration[5.1]
  def change
    add_column :labs, :processing_at, :datetime
  end
end
