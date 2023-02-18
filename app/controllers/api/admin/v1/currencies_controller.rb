# frozen_string_literal: true

# Admin APIs
class Api::Admin::V1::CurrenciesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    resource = CurrencyExchangeRate.import_data(params[:file])
    render json: resource, status: :ok
  end
end
