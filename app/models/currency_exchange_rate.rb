# frozen_string_literal: true

# CurrencyExchangeRate
class CurrencyExchangeRate < ApplicationRecord
  belongs_to :from_country, class_name: 'Country', foreign_key: :from_id
  belongs_to :to_country, class_name: 'Country', foreign_key: :to_id

  validates :from_id, :to_id, :exchange_value, :previous_variance, presence: true

  class << self
    def last_exchange_data(from, to)
      includes(:from_country, :to_country).where(from_country: { country_code: from })
                                          .where(to_country: { country_code: to })
                                          .order(created_at: :desc)&.first
    end
  end
end
