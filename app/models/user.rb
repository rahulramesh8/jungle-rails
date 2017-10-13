class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    has_secure_password
    has_many :reviews

    validates :name, :email, :password_confirmation, presence: true
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, length: {minimum: 5}
end
