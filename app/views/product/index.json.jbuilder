json.products do
    json.array! @products, partial: 'product_partial', as: :product
end