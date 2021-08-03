class User < ApplicationRecord
    has_secure_password 
    has_many :reviews
    has_many :zoos, through: :reviews

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true 
    validates :password, length: { minimum: 8 }
end
