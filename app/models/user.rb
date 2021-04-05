class User < ActiveRecord::Base
  has_secure_password
  validates :first_name presenc: true
  validates :last_name presenc: true
end
