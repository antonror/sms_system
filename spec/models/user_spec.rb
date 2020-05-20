require 'rails_helper'

RSpec.describe User, type: :model do
  # Columns
  it { should have_db_column(:email) }
  it { should have_db_column(:phone) }
  it { should have_db_column(:first_name) }
  it { should have_db_column(:last_name) }

  # Relations
  it { should have_many(:notifications) }
end
