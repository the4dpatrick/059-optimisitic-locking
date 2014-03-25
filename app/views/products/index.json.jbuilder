json.array!(@products) do |product|
  json.extract! product, :id, :category_id, :name, :price, :released_on, :view_count
  json.url product_url(product, format: :json)
end
