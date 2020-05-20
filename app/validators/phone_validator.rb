class PhoneValidator< ActiveModel::EachValidator
  PATTERN = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/.freeze

  def validate_each(record, attribute, value)
    unless PATTERN.match?(value)
      record.errors.add(attribute, :invalid_pattern)
    end
  end
end
