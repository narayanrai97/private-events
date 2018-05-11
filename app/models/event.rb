class Event < ApplicationRecord
    default_scope -> { order(:date) } 
    
    belongs_to :creator,    :class_name => "User", touch: true #touch: true for CALLBACK
    has_many   :attendings, foreign_key: :attended_event_id
    has_many   :attendees,  through: :attendings
    # has_many :attendees, -> { distinct }, through: :attendings

    validates :name, presence: true, uniqueness: true, length: { maximum: 60 }
    validates :date, presence: true
    validates :description, presence: true, uniqueness: true
    # validates :attendees, uniqueness: true
    
    scope :upcoming_events, -> { where('date >= ?', Time.zone.now) }
    scope :past_events,     -> { where('date < ?', Time.zone.now) }
    
    # Callbacks
    after_destroy :log_destroy_action
    
    after_touch do
        puts 'An Event was touched'
    end
    
    private
        # Callbacks
        def log_destroy_action
            puts 'Event destroyed'
        end
end
