class Event < ApplicationRecord
  has_rich_text :description

  # validations
  validates :date, presence: true
  validates :location, presence: true
  validates :title, presence: true

  # associations
  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendances

  # scopes
  scope :past, -> { where("date < ?", Date.today) }
  scope :upcoming, -> { where("date >= ?", Date.today) }
end
