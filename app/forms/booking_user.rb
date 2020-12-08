class BookingUser
  include ActiveModel::Model
  attr_accessor :email, :encrypted_password

  validates :email, presence: true
  validates :encrypted_password, presence: true
end
