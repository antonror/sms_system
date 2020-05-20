RSpec.describe PhoneValidator do
  describe 'validate_each' do
    context 'when phone number matches the pattern' do
      it 'does NOT add an error to the record' do
        valid_phone = '+4812504203260'
        attribute = :attribute
        errors = spy(:errors)
        record = double(:record, errors: errors)
        validator = PhoneValidator.new(attributes: [attribute])

        validator.validate_each(record, attribute, valid_phone)

        expect(errors).not_to have_received(:add)
      end
    end

    context 'when phone does NOT match the pattern' do
      it 'adds an error to the record' do
        invalid_phone = '+48.504.203.260'
        attribute = :attribute
        errors = spy(:errors)
        record = double(:record, errors: errors)
        validator = PhoneValidator.new(attributes: [attribute])

        validator.validate_each(record, attribute, invalid_phone)

        expect(errors).to have_received(:add).with(attribute, :invalid_pattern)
      end
    end
  end
end
