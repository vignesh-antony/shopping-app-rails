class ProductController < ApplicationController
    def index
        authorize Product
        @products = Product.all
    end

    def create
        @product = Product.new(verify_params)
        raise StandardError unless @product.save!

        render json: { message: 'Product created successfully', product_id_created: @product.id }, status: :ok
    end

    private

    def verify_params
        params.require(:product).permit(:product_name, :product_type, :product_prize, :product_stock)
    end
end