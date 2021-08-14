class User < ApplicationRecord
    has_secure_password 
    has_many :reviews
    has_many :zoos, through: :reviews

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true 

    def self.from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u| 
          u.email = auth['info']['email']
          u.username = auth['info']['name']
          u.password = SecureRandom.hex(15)
        end
    end
end
