class CreateLabs < ActiveRecord::Migration[5.1]
  def change
    create_table :labs do |t|
      t.integer :complexity
      t.text :comment

      t.timestamps
    end
  end
end
