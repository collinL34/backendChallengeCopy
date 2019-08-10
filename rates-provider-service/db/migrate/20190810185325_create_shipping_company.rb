class CreateShippingCompany < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_companies do |t|
      t.string   :company_name
      t.float    :flat_shipping_rate_usd
    end
  end
end
