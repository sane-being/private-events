class Event < ApplicationRecord
  # validations
  validates :date, presence: true
  validates :location, presence: true

  # associations
  belongs_to :creator, class_name: "User"# , primary_key: "id"
end
