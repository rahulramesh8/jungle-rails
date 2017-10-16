class User < ActiveRecord::Base
    before_save do
        self.email = self.email.downcase unless self.email.nil?
    end
        # |user| user.email = user.email.downcase}
    has_secure_password
    has_many :reviews
    
    validates :name, :email, :password_confirmation, presence: true
    validates :email, uniqueness: { case_sensitive: true}
    validates :password, length: {minimum: 5}

    def self.authenticate_with_credentials(email, password)
        # email = email.to_s.strip
        puts "Email is: #{email}"
        user = User.where("email = ?", email.downcase).first
        puts "User in model is #{user}"
        if user && user.authenticate(password)
          user
        else
          nil
        end
      end
end
