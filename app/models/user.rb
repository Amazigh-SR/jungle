class User < ActiveRecord::Base
  has_secure_password
  
  #Checking that all fields are present
  validates :name, presence: true # In my case, name encompasses both first and last name
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 8} 
  validates :password_confirmation, presence: true


  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end  
  end


end
