class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # associations
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  has_many :attended_events, through: :attendance, source: :attendee
  has_many :attendances, foreign_key: :attendee_id
end
