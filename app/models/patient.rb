class Patient < ActiveRecord::Base
    has_many :strains

    # has_secure_password
end