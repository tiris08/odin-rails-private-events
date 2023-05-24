class Event < ApplicationRecord
  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances, source: :attendee
  belongs_to :creator, class_name: "User", optional: true

  scope :upcoming, -> { where('events.date::date >= ?', Date.current) }
  scope :past, -> { where('events.date::date <= ?', Date.current) }
end
