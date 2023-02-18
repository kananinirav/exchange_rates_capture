# frozen_string_literal: true

# Api::Public::V1::CurrenciesController
class Api::Public::V1::CurrenciesController < ApplicationController
  def index
    # @resource = CurrencyExchangeRate.search(params)
    service_call = SearchExchangeRate.call({ params: params })
    @resource = service_call.data
    @errors = service_call.errors
  end
end
