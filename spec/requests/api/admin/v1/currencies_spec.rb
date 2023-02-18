# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Admin::V1::Currencies', type: :request do
  describe 'POST api/admin/v1/currencies' do
    # before(:context) do
    #   country_data = [
    #     %w[India INR],
    #     %w[Japan JPY],
    #     %w[US USD]
    #   ]
    #   country_data.each do |country, country_code|
    #     FactoryBot.create(:country, country: country, country_code: country_code)
    #   end
    # end

    # it 'has match match count' do
    #   expect(Country.all.count).to eq(3)
    # end

    # it 'it has create successfully request' do
    #   params = {
    #     from: 'USD',
    #     to: 'JPY',
    #     date: '2023-01-29',
    #     exchange_data: 111.23
    #   }
    #   expect do
    #     post '/api/public/v1/currencies', params: params
    #   end.to change(CurrencyExchangeRate, :count).by(1)
    # end
  end
end
