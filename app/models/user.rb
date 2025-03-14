class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # self.primary_key = "id"

  # associations
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
end
