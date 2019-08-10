class CreateShippingCompanyRates < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_company_rates do |t|
      t.float    :shipping_rate_usd
      t.string   :origin_code
      t.string   :destination_code
      t.integer  :company_id
    end
  end
end
