Rails.application.routes.draw do
  get '/rates_data_dump' => 'api_endpoint#data_dump'

  get '/shipping_rates' => 'shipping_company_rates#get'
  get '/shipping_companies' => 'shipping_companies#get'
  put '/shipping_rates' => 'shipping_company_rates#put'
end
