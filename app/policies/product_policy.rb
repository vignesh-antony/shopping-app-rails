class ProductPolicy < ApplicationPolicy
    def index?
        user.is_valid_customer?
    end
end