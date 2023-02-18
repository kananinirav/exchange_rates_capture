# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :from_exchange_rates, class_name: 'CurrencyExchangeRate', foreign_key: :from_id
  has_many :to_exchange_rates, class_name: 'CurrencyExchangeRate', foreign_key: :to_id
end
