# frozen_string_literal: true

# for import exchange rate data
class ExchangeRateImport < ApplicationService
  require 'csv'
  def initialize(options)
    @file = options[:file]
    @service_result = ServiceResult.new('Import Exchange Rate')
  end

  def call
    import_data
    @service_result
  rescue => e
    Rails.logger.info e
  end

  private

  def import_data
    exchange_records = []
    CSV.read(@file, headers: true).each do |row|
      exchange_record = prepare_hash(row)
      exchange_records << exchange_record
    end
    @service_result.data = CurrencyExchangeRate.import(exchange_records)
  end

  def prepare_hash(row)
    {
      from_id: find_country_id(row['from']),
      to_id: find_country_id(row['to']),
      exchange_value: row['exchange_rate'],
      previous_variance: calculate_previous_variance(row['from'], row['to'], row['exchange_rate'])
    }
  end

  def calculate_previous_variance(from, to, exchange_value)
    last_record = CurrencyExchangeRate.last_exchange_data(from, to)&.exchange_value || 0.0

    return 0.0 if last_record.zero?

    (exchange_value.to_f - last_record).round(4)
  end

  def find_country_id(country_code)
    Country.find_by(country_code: country_code)&.id
  end
end
