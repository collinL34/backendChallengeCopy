require 'csv'
require 'awesome_print'

module CsvHandlerModule  
  def self.read_file(file_path)
    csv_text = File.read(file_path)
    
    CSV.parse(csv_text, :headers => true)
  end

  def self.provider_model_csv_data_convert(file_path)
    csv_array = read_file(file_path)

    csv_array.map do |csv_row|
      flat_shipping_rate_usd = if csv_row['currency'] == 'EUR'
                                (csv_row['flat shipping rate'].to_f * 1.18115).round(2)
                              else
                                csv_row['flat shipping rate'].to_f
                              end

      {
        :company_name => csv_row['name'],
        :flat_shipping_rate_usd => flat_shipping_rate_usd
      }
    end
  end

  def self.provider_rates_model_csv_data_convert(file_path)
    csv_array = read_file(file_path)

    csv_array.map do |csv_row|
      shipping_rate_usd = if csv_row['currency'] == 'EUR'
                                (csv_row['rate'].to_f * 1.18115).round(2)
                              else
                                csv_row['rate'].to_f
                              end

      {
        :shipping_rate_usd => shipping_rate_usd,
        :origin_code => csv_row['origin'],
        :destination_code => csv_row['destination'],
        :company_id => csv_row['shipping company id'].to_i
      }
    end
  end
end
