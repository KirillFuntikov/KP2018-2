class Lab < ApplicationRecord
  belongs_to :subject
  belongs_to :user

  scope :fire_lab_scope, -> { where('deadline <= ?', Time.now + 2.days)}

  enum status: { todo: 0, processing: 1, done: 2 } do
    event :process do
      after do
        self.processing_at = Time.now
        self.save
      end

      transition :todo => :processing
    end

    event :complete do
      after do
        self.done_at = Time.now
        self.save
      end

      transition :processing => :done
    end
  end

  attr_accessor :state_event
  after_save :trigger_state, if: :state_event
  private def trigger_state
    send(state_event) if send(:"can_#{state_event}?")
  end

  def self.to_csv
    attributes = %w[id user_id comment complexity deadline status]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |lab|
        csv << attributes.map {|attr| lab.send(attr)}
      end
    end
  end
end
