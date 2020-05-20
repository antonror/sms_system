RSpec.describe EmailValidator do
  describe 'validate_each' do
    context 'when the email matches the pattern' do
      it 'does NOT add an error to the record' do
        valid_email = 'daniel@example.com'
        attribute = :attribute
        errors = spy(:errors)
        record = double(:record, errors: errors)
        validator = EmailValidator.new(attributes: [attribute])

        validator.validate_each(record, attribute, valid_email)

        expect(errors).not_to have_received(:add)
      end
    end

    context 'when the email does NOT match the pattern' do
      it 'adds an error to the record' do
        invalid_email = 'invalid email'
        attribute = :attribute
        errors = spy(:errors)
        record = double(:record, errors: errors)
        validator = EmailValidator.new(attributes: [attribute])

        validator.validate_each(record, attribute, invalid_email)

        expect(errors).to have_received(:add).with(attribute, :invalid_pattern)
      end
    end
  end
end
