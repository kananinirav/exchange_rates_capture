# frozen_string_literal: true

# Admin APIs
class Api::Admin::V1::CurrenciesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    service = ExchangeRateImport.call(file: params[:file])
    if service.is_success
      render json: service.data, status: :ok
    else
      render json: 'Server Error !!!', status: :bad_request
    end
  end
end
