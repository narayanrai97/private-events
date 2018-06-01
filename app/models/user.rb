class User < ApplicationRecord
    has_many :events, dependent: :destroy,
                      foreign_key: :creator_id
    after_touch :log_when_events_or_user_touched #callbacks
    
    has_many :attendings, foreign_key: :attendee_id
    has_many :attended_events, through: :attendings
    
    validates :name,  presence: true, length: { maximum: 25 }, uniqueness: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    after_initialize do |user|
        puts "You have initialized an object!"
    end
    
    after_find do |user|
        puts "You've found an object!"
    end
    
    before_validation :normalize_name_email, on: [:create, :update] #callback
    
    # Twitter login/logout
    def self.from_omniauth(auth)    
       where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
    end
    
    def self.create_from_omniauth(auth)
        create! do |user|
            user.provider = auth["provider"]
            user.uid      = auth["uid"]
            user.name     = auth["info"]["nickname"]
        end
    end
   
   private
    
    # Callbacks
    def normalize_name_email
        self.name = name.downcase.titleize
        self.email = email.downcase if email.present?
    end
    
    def log_when_events_or_user_touched
        puts 'Event/User was touched'
    end
    
end
