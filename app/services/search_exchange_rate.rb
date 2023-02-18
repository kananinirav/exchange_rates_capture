# frozen_string_literal: true

# SearchExchangeRate
class SearchExchangeRate < ApplicationService
  def initialize(options)
    @options = options
    @service_result = ServiceResult.new('Search Exchange Rate')
  end

  def call
    validate_params
    return @service_result unless @service_result.is_success

    search_data
    @service_result
  end

  private

  def validate_params
    validate_params = @options[:params].values_at(:from_country, :to_country, :exchange_date).any?(&:nil?)
    return unless validate_params

    @service_result.errors << 'Invalid Parameters !!!'
    @service_result.is_success = false
  end

  def search_data
    @service_result.data = search(@options[:params])
  end

  def search(params)
    exchange_date = params[:exchange_date]&.to_date
    resources = CurrencyExchangeRate.includes(:from_country, :to_country)
                                    .where(from_country: { country_code: params[:from_country] })
                                    .where(to_country: { country_code: params[:to_country] })
                                    .where('currency_exchange_rates.created_at::date = ?', exchange_date)
                                    .order(created_at: :desc)&.first
    resources || CurrencyExchangeRate.last_exchange_data(params[:from_country], params[:to_country])
  end
end
