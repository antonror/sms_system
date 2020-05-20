# Notification service spec
RSpec.describe NotificationSender, type: :service do
  describe 'architecture' do
    context 'class hierarchy' do
      it 'should inherit behavior from Parent' do
        expect(NotificationSender.superclass).to eq(ApplicationService)
      end
    end
  end

  describe 'functionality' do
    context 'get results with valid data' do
      it 'sends message to valid user using valid notification data' do
        user = FactoryBot.create(:user_with_notifications)
        result = NotificationSender.call(user)

        expect(result).to be_a_kind_of(Hash)
        expect(result).to include(:user, :emails_sent, :sms_sent)

        expect(result[:user]).to be_a_kind_of(User)

        expect(result[:emails_sent]).to be >= 1
        expect(result[:sms_sent]).to be >= 1
      end
    end

    context 'raises an error with valid data' do
      it 'doesnt send any message with completely malformed data' do
        user = FactoryBot.create(:user_with_malformed_data)
        expect do
          NotificationSender.call(user)
        end.to raise_error(StandardError, 'You are trying to send an empty messages')
      end

      it 'doesnt send messages with malformed data and sends correct messages' do
        user = FactoryBot.create(:user_with_partially_malformed_data)
        result = NotificationSender.call(user)
        expect(result).to be_a_kind_of(Hash)
        expect(result).to include(:user, :emails_sent, :sms_sent)

        expect(result[:user]).to be_a_kind_of(User)

        expect(result[:emails_sent]).to be 0
        expect(result[:sms_sent]).to be >= 1
      end
    end
  end
end