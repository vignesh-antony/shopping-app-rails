class ApplicationController < ActionController::API
    include Authenticate
    include ExceptionHandler
    include Pundit
end
