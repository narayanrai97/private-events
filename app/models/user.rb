class User < ApplicationRecord
    has_many :events, dependent: :destroy,
                      foreign_key: :creator_id
    has_many :attendings, foreign_key: :attendee_id
    has_many :attended_events, through: :attendings
    
    validates :name, presence: true, length: { maximum: 25 }, uniqueness: true
    validates :email, presence: true, length: { maximum: 25 }, uniqueness: true
    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
