class AddAttendeeAndAttendedEventToEventAttendence < ActiveRecord::Migration[6.1]
  def change
    add_reference :event_attendances, :attendee, foreign_key: { to_table: :users }
    add_reference :event_attendances, :attended_event, foreign_key: { to_table: :events }
  end
end
