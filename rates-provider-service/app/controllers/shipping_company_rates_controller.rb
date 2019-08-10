class ShippingCompanyRatesController < ApplicationController
  def get
    all_shipping_rates = ShippingCompanyRates.all

    render json: all_shipping_rates    
  end
end