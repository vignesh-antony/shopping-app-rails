module Authenticate
    extend ActiveSupport::Concern

    included do
        before_action :authenticate_request
    end

    def current_user
        customer_id = request.headers['Customer-Id']
        Customer.where(id: customer_id).first 
    end

    def authenticate_request
        Rails.logger.info "Current Customer Identity: #{request.headers['Customer-Id']}"
    end
end