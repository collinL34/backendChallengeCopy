class ShippingCompanyRate < ApplicationRecord
  validates_presence_of :shipping_rate_usd, 
                        :origin_code, 
                        :destination_code, 
                        :company_id

  validates_numericality_of :shipping_rate_usd,
                            :company_id
end