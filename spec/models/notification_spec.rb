require 'rails_helper'

RSpec.describe Notification, type: :model do
  # Columns
  it { should have_db_column(:kind) }
  it { should have_db_column(:body) }
  it { should have_db_column(:confirmation_message) }

  # Relations
  it { should belong_to :user }
end
