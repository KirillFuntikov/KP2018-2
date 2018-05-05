class AddAttachmentSubjectImgToSubjects < ActiveRecord::Migration[5.1]
  def self.up
    change_table :subjects do |t|
      t.attachment :subject_img
    end
  end

  def self.down
    remove_attachment :subjects, :subject_img
  end
end
