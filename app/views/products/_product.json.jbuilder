json.extract! product, :id, :name, :size, :packaging, :description, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
