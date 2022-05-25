class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :event_confirmations
  has_many :attendees, through: :event_confirmations
end
