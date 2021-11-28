class OrderController < ApplicationController
    before_action :set_product

    def index
        @orders = Order.all
    end

    def create
        @order = Order.new(verify_params)
        unless stock_available? @order.quantity
            raise CustomError::BadRequest, 'Product is out of stock'
        end

        raise StandardError unless update_product_stock and @order.save!

        render json: {
                   message: 'Order placed successfully',
                   order_id_created: @order.id,
               },
               status: :ok
    end

    private

    def verify_params
        params.require(:order).permit(:product_id, :customer_id, :quantity)
    end

    def set_product
        @product = Product.find(id: params[:product_id])
    end

    def stock_available?(quantity)
        @product.product_stock >= quantity
    end

    def update_product_stock
        remaining_stock = @product.product_stock - @order.quantity
        @product.update!(product_stock: remaining_stock)
    end
end
