class EventConfirmation < ApplicationRecord
  belongs to :attendee, class_name: "User"
  belongs to :event
end
