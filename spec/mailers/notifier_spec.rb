require 'rails_helper'

RSpec.describe Notifier, type: :mailer do
  let(:mail) { described_class.exchange_rate_data_import(1).deliver_now }

  it 'renders the subject' do
    expect(mail.subject).to eq('Data Import Successfully Completed')
  end

  it 'check sender email' do
    expect(mail.from).to eq(['noreply@example.com'])
  end

  it 'check receiver email' do
    expect(mail.to).to eq(['test@example.com'])
  end

  it 'check import count' do
    expect(mail.body.encoded).to match('Import Data Count: 1')
  end
end
