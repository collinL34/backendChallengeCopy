require 'awesome_print'

shipping_company_data = CsvHandlerModule.provider_model_csv_data_convert('../service_provider_data.csv')

shipping_company_data.each do |shipping_company_object|
  ap ShippingCompany.create(shipping_company_object)
end

# shipping_company_rates_data = CsvHandlerModule.provider_rates_model_csv_data_convert('../rate_data.csv')
