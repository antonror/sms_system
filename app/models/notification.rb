# Notification model
class Notification < ApplicationRecord
  MAX_BODY_LENGTH = 200

  belongs_to :user

  validates(
    :body,
    length: { maximum: MAX_BODY_LENGTH},
    presence: true,
  )

  enum kind: { email: 0, sms: 1 }
end
