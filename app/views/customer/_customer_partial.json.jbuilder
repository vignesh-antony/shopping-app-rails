json.extract! customer, :_id, :first_name, :last_name, :email, :created_at, :updated_at
json.contact_number customer.contact_number if customer.contact_number.present?
