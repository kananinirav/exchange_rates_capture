require 'rails_helper'

RSpec.describe CurrencyExchangeRate, type: :model do
  describe 'associations' do
    it { should belong_to(:from_country).class_name('Country') }
    it { should belong_to(:to_country).class_name('Country') }
  end

  describe 'Validations' do
    it { should validate_presence_of(:from_id) }
    it { should validate_presence_of(:to_id) }
    it { should validate_presence_of(:exchange_value) }
  end

  # describe '.import_data' do
  #   let(:us) { create(:country, country: 'US', country_code: 'USD') }
  #   let(:inr) { create(:country, country: 'India', country_code: 'INR') }
  #   let(:jpy) { create(:country, country: 'Japan', country_code: 'JPY') }
  #   let(:file) {
  #     Tempfile.open(['exchange_rates.csv', '.csv']) do |temp|
  #       CSV.open(temp, 'wb', headers: true) do |csv|
  #         csv << %w[from to exchange_rate]
  #         csv << [us.country_code, inr.country_code, 100.2]
  #         csv << [us.country_code, jpy.country_code, 80.0]
  #         csv << [inr.country_code, jpy.country_code, 10.0]
  #       end
  #     end
  #   }

  #   it 'imports the data from the csv file' do
  #     expect { CurrencyExchangeRate.import_data(file.path) }.to change { CurrencyExchangeRate.count }.by(3)
  #   end
  # end
end
