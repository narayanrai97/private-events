class Attending < ApplicationRecord
    belongs_to :attendee, class_name: "User"
    belongs_to :attended_event, class_name: "Event"
    
    validates :attendee_id, uniqueness: { scope: :attended_event_id } #Cruz helped
    # I believed something like this can also be used to make it unique
    # add_index :attendings, [:attendee_id, :attended_event_id], unique: true
end
