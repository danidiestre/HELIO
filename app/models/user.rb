class User < ApplicationRecord
  has_many :bookings
  has_many :reviews, through: :bookings
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, invite_for: 2.weeks
end
