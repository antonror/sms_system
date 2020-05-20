# Notification service spec
RSpec.describe NotificationSender, type: :service do
  context 'class hierarchy' do
    it 'should inherit behavior from Parent' do
      expect(NotificationSender.superclass).to eq(ApplicationService)
    end
  end
end