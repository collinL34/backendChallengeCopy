class ApiEndpointController < ApplicationController
  def data_dump
    sql_q = "
              SELECT 
                *
              FROM shipping_companies company
              JOIN shipping_company_rates AS rates
                ON rates.company_id = company.id;
            "
    data_res = ActiveRecord::Base.connection.execute(sql_q)

    render :json => data_res.to_json
  end
end