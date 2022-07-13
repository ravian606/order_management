json.extract! contact, :id, :title, :first_name, :last_name, :number, :street_address1, :street_address2, :town, :post_code_string, :email, :phone_number, :head_office, :buyer, :invoice, :site_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
