FactoryBot.define do
  factory :notification do
    body { Faker::Lorem.sentence }
    confirmation_message { Faker::Crypto.md5 }
    kind { nil }
    user
  end

  factory :user do
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    email       { Faker::Internet.safe_email }
    phone       { '+944937040625' }

    factory :user_with_notifications do
      after(:create) do |user, _|
        create(:notification, kind: 0, user: user)
        create(:notification, kind: 1, user: user)
      end
    end

    factory :user_with_malformed_data do
      after(:create) do |user, _|
        create(:notification, kind: 0, user: user, something_wrong: true)
        create(:notification, kind: 1, user: user, something_wrong: true)
      end
    end

    factory :user_with_partially_malformed_data do
      after(:create) do |user, _|
        create(:notification, kind: 0, user: user, something_wrong: true)
        create(:notification, kind: 1, user: user, something_wrong: false)
      end
    end
  end
end