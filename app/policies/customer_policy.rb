class CustomerPolicy < ApplicationPolicy
  %i[index create show update destroy].each do |action|
    define_method "#{action}?" do
      user.is_valid_customer?
    end
  end
end
