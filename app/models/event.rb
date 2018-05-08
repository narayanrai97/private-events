class Event < ApplicationRecord
    belongs_to :creator,    :class_name => "User"
    has_many   :attendings, foreign_key: :attended_event_id
    has_many   :attendees,  through: :attendings
    
    validates :date, presence: true
    validates :description, presence: true
    
    scope :upcoming_events, -> { where('date >= ?', Time.zone.now) }
    scope :past_events,     -> { where('date < ?', Time.zone.now) }
end
