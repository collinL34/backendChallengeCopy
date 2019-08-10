class CreateCompanyShippingRates < ActiveRecord::Migration[5.2]
  def change
    create_table :company_shipping_rates do |t|
      t.float    :shipping_rate_usd
      t.string   :origin_code
      t.string   :destination_code
      t.integer  :company_id
    end
  end
end
