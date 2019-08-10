class ShippingCompanyRatesController < ApplicationController
  def get
    shipping_company_rates_data_dump = ShippingCompanyRate.all

    render :json => shipping_company_rates_data_dump    
  end

  def put
    entry_id = params['id']
    rate_entry = ShippingCompanyRate.find(entry_id).update(rates_params)

    if rate_entry
      render :json => rate_entry
    else
      render :json => rate_entry.errors.full_messages
    end
  end

  private

  def rates_params
    params.permit(:origin_code,
                  :destination_code,
                  :company_id)
  end
end