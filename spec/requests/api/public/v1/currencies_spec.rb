# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Public::V1::Currencies', type: :request do
  describe 'GET api/public/v1/currencies' do
    context 'when the currency exchange data is found' do
      before(:context) do
        [
          %w[India INR],
          %w[Japan JPY],
          %w[US USD]
        ].each do |country, country_code|
          FactoryBot.create(:country, country: country, country_code: country_code)
        end

        [
          [Country.find_by(country_code: 'USD')&.id, Country.find_by(country_code: 'INR')&.id, 80.0, Time.zone.now],
          [Country.find_by(country_code: 'INR')&.id, Country.find_by(country_code: 'JPY')&.id, 1.31,
           Time.zone.now - 1.days]
        ].each do |from_id, to_id, exchange_value, created_at|
          FactoryBot.create(:currency_exchange_rate, from_id: from_id, to_id: to_id, exchange_value: exchange_value,
                                                     created_at: created_at)
        end
      end

      it 'returns the currency exchange rate data' do
        get '/api/public/v1/currencies',
            params: { from_country: 'USD', to_country: 'INR', exchange_date: Time.zone.now, format: :json }

        expected_response = {
          data: {
            from_country: 'USD',
            to_country: 'INR',
            exchange_rate: 80.0,
            variance: 0.0,
            exchange_date: Time.zone.now.to_date
          }
        }.to_json

        expect(response).to have_http_status(:ok)
        expect(json_response).to eq(JSON.parse(expected_response))
      end
    end

    context 'when currency exchange data not found' do
      it 'returns an error message' do
        expected_response = {
          errors: ['No Data Found!!!']
        }.to_json
        get '/api/public/v1/currencies',
            params: { from_country: 'USD', to_country: 'VED', exchange_date: Time.zone.now, format: :json }
        expect(response).to have_http_status(:ok)
        expect(json_response).to eq(JSON.parse(expected_response))
      end
    end
  end
end
