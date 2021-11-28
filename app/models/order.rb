class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection: :orders

  field :quantity, type: Integer
  field :is_amount_paid, type: Boolean

  belongs_to :customer
  belongs_to :product
end
