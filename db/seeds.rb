TAGS = %w[ %email% %phone% %first_name% %last_name% ]

# Create users
FactoryBot.create_list(:user, 2)

# Create notifications
FactoryBot.create_list(:notification, 3, user: User.first, kind: 'email')
FactoryBot.create_list(:notification, 3, user: User.last, kind: 'sms')

# Add some tags
Notification.all.each do |notification|
  TAGS.each do |tag|
    notification.body << " #tag #{tag.gsub('%', '')} replaced with #{tag} "
  end

  notification.save
end
