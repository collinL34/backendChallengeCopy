class ShippingCompany < ApplicationRecord
  validates_presence_of :company_name, :flat_shipping_rate_usd
  validates_numericality_of :flat_shipping_rate_usd
end