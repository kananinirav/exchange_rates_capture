# frozen_string_literal: true

# mail notifier
class Notifier < ApplicationMailer
  default from: 'noreply@example.com'

  def exchange_rate_data_import(import_count)
    @count = import_count
    mail to: 'test@example.com', subject: 'Data Import Successfully Completed'
  end
end
