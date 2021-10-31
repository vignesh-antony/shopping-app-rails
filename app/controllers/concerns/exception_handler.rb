module ExceptionHandler
    extend ActiveSupport::Concern

    included do
        rescue_from Exception, with: :handle_exception
        rescue_from CustomError::BadRequest, with: :handle_custom_error
        rescue_from CustomError::UnprocessableEntity, with: :handle_custom_error
        rescue_from Pundit::NotAuthorizedError, with: :handle_user_not_authorized
    end

    private

    def render_error(message, status)
        render json: { error: { message: message } }, status: status 
    end

    def handle_exception(e)
        render_error(e.message, :internal_server_error)
    end

    def handle_custom_error(e)
        render_error(e.message, e.status_code)
    end

    def handle_user_not_authorized(e)
        render_error("Customer not authorized. #{e.message}", :forbidden)
    end
end