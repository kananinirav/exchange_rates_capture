require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'associations' do
    it { should have_many(:from_exchange_rates).class_name('CurrencyExchangeRate') }
    it { should have_many(:to_exchange_rates).class_name('CurrencyExchangeRate') }
  end
end
