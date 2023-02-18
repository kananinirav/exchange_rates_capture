# frozen_string_literal: true

FactoryBot.define do
  factory :currency_exchange_rate do
    from_id { 'India' }
    to_id { 'INR' }
    exchange_value { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    previous_variance { 0.0 }
    created_at { Time.zone.now }
  end
end
