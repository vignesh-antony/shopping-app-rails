json.customers do
    json.array! @customers, partial: 'customer_partial', as: :customer
end