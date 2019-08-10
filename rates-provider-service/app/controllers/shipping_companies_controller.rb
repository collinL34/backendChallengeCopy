class ShippingCompaniesController < ApplicationController
  def get 
    shipping_company_data_dump = ShippingCompany.all

    render json: shipping_company_data_dump 
  end
end