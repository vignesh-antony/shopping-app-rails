class CustomerController < ApplicationController
    def index
        authorize Customer
        @customers = Customer.all
    end

    def create
        @customer = Customer.new(verify_params)
        raise Exception, "Customer not saved" unless @customer.save!
        render json: { 
            message: "User successfully created", 
            user_id_created: @customer.id, 
        }, status: :ok
    end

    def show
        authorize Customer
        @customer = Customer.where(id: params[:id]).first
    end
    
    def update
        @customer = Customer.find(params[:id])
        raise CustomError::UnprocessableEntity, @customer.errors.full_messages unless @customer.update_attributes(verify_params)
        render :show
    end
    
    def destroy
        @customer = Customer.find(params[:id])
        raise Exception, @customer.errors.full_messages unless @customer.destroy
        render json: { message: "User deleted successfully" }, status: :ok
    end

    private

    def verify_params
        params.require(:customer).permit(:first_name, :last_name, :email, :contact_number, :address)
    end
end
