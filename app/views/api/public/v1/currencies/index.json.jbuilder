# frozen_string_literal: true

if @resource.present?
  json.data do
    json.from_country @resource.from_country.country_code
    json.to_country @resource.to_country.country_code
    json.exchange_rate @resource.exchange_value
    json.variance @resource.previous_variance
    json.exchange_date @resource.created_at.to_date
  end
elsif @errors.present?
  json.errors @errors
else
  json.errors ['No Data Found!!!']
end
