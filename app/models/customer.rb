class Customer
    include Mongoid::Document
    include Mongoid::Timestamps
    
    store_in collection: :customers

    field :first_name, type: String
    field :last_name, type: String
    field :email, type: String
    field :contact_number, type: String
    field :address, type: Hash

    scope :filter_by_contact_number, -> { where(:contact_number.ne => nil)}

    def is_valid_customer?
        first_name.present? and email.present?
    end

end
