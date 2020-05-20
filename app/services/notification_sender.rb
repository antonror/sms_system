# Notification sender service
class NotificationSender < ApplicationService
  def initialize(user)
    @user = user
    @notifications = user.notifications
    @emails_sent = 0
    @sms_sent = 0
  end

  def call
    unless @notifications.pluck(:something_wrong).all?
      send_messages
      provide_output
    else
      raise StandardError, 'You are trying to send an empty messages'
    end
  end

  def send_messages
    @notifications.each do |notification|
      unless notification.something_wrong?
        p "#{email_or_phone(notification)} received"
        p prepare_body(notification)
      else
        p 'Something is wrong with the notification'
      end
    end
  end

  def provide_output
    {
        user: @user,
        emails_sent: @emails_sent,
        sms_sent: @sms_sent,
    }
  end

  private

  def email_or_phone(notification)
    case notification.kind

    when 'email'
      @emails_sent+=1
      @user.email
    when 'sms'
      @sms_sent+=1
      @user.phone
    end
  end

  def prepare_body(notification)
    notification.body
        .gsub('%email%', @user.email)
        .gsub('%phone%', @user.phone)
        .gsub('%first_name%', @user.first_name)
        .gsub('%last_name%', @user.last_name)
  end
end
