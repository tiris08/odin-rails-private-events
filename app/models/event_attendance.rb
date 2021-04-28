class EventAttendance < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :attended_event, class_name: "Event"

  validates :attendee_id, uniqueness: { scope: :attended_event_id }
  validates :attended_event_id, uniqueness: { scope: :attendee_id }
end
