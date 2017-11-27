class User < ApplicationRecord
    has_many :tweets
    
    validates :email, uniqueness: true
    validates :email, :password_digest, :username, presence: true
    has_secure_password

    def self.destroy_all
        self.all.each {|user| user.destroy}
    end
end
