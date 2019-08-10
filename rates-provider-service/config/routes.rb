Rails.application.routes.draw do
  # GET route for client data dump
  get '/rates_data_dump' => 'api_endpoint#data_dump'

  # basic routes for deep dive into data
  get '/shipping_rates' => 'shipping_company_rates#get'
  get '/shipping_companies' => 'shipping_companies#get'
  put '/shipping_rates' => 'shipping_company_rates#put'
end
