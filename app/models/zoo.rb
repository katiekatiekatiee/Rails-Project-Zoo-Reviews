class Zoo < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews 
    belongs_to :location
    accepts_nested_attributes_for :reviews #, reject_if: proc { |attribtues| attributes[:title].blank? || attributes[:title].blank? }
    
end
