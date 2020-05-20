# User model
class User < ApplicationRecord
  has_many :notifications
end
