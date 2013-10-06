class User < ActiveRecord::Base
 before_save { self.email = email.downcase }
 validates :username, uniqueness: { case_sensitive: false },
 					  presence: true, 
 					  length: { maximum: 15 }

 validates :password, presence: true, 
 					  length: { minimum: 6 }

 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[sydney]+\.[edu]+\.[au]+\z/i

 validates :email, uniqueness: { case_sensitive: false }, 
 					  presence: true, 
 					  format: { with: VALID_EMAIL_REGEX }
 					  
 has_secure_password
end
