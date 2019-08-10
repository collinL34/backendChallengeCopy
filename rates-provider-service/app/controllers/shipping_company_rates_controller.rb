class ShippingCompanyRatesController < ApplicationController
  def get
    shipping_company_rates_data_dump = ShippingCompanyRate.all

    render json: shipping_company_rates_data_dump    
  end
end