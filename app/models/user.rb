# User model
class User < ApplicationRecord
  has_many :notifications, dependent: :destroy

  validates :email, email: true
  validates :phone, phone: true
  validates_presence_of :first_name, :last_name
end
