class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :title
      t.text :description
      t.string :teacher

      t.timestamps
    end
  end
end
