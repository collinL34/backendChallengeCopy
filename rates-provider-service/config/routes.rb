Rails.application.routes.draw do
  get '/shipping_rates' => 'shipping_company_rates#get'

  get '/shipping_companies' => 'shipping_companies#get'
end
