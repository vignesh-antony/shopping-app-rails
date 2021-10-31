module CustomError
    class BadRequest < StandardError
        def initialize(message)
            super(message)
        end
        
        def status_code
            400
        end
    end
    class UnprocessableEntity < StandardError
        def initialize(message)
            super(message)
        end
        
        def status_code
            422
        end
    end 
end