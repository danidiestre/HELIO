class Event < ApplicationRecord
    has_many :iterations
    belongs_to :category
    has_many :bookings, through: :iterations
end
