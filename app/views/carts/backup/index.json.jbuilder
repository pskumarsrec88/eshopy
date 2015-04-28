json.array!(@carts) do |cart|
  json.extract! cart, :id, :quantity, :price, :value
  json.url cart_url(cart, format: :json)
end
