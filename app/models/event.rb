class Event < ApplicationRecord
  # validations
  validates :date, presence: true
  validates :location, presence: true

  # associations
  belongs_to :creator, class_name: "User"
  has_many :attendees, through: :attendance, source: :attended_events
  has_many :attendances, foreign_key: :attended_event_id
end
