json.extract! site, :id, :name, :number, :street_address_one, :street_address_two, :town, :post_code, :head_office, :invoice_address, :contact, :invoice_email, :invoice, :payment_method, :created_at, :updated_at
json.url site_url(site, format: :json)
