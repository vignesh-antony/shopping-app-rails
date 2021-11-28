class Product
    include Mongoid::Document
    include Mongoid::Timestamps

    store_in collection: :products

    field :product_name, type: String
    field :product_type, type: String
    field :product_prize, type: Float
    field :product_stock, type: Integer

    has_many :orders
end
