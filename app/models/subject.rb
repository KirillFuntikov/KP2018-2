class Subject < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :labs

    has_attached_file :subject_img, styles: { subject_index: "250x350", subject_show: "350x450>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :subject_img, content_type: /\Aimage\/.*\z/

  def self.to_csv
    attributes = %w[id title description teacher created_at]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |subject|
        csv << attributes.map{ |attr| subject.send(attr) }
      end
    end
  end
end
